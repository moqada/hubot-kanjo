# Description
#   Summarize AWS Billing for Hubot.
#
# Commands:
#   hubot kanjo - Show AWS Billing of current month
#   hubot kanjo <YYYYMM> - Show AWS Billing of target month
#
# Configuration:
#   HUBOT_KANJO_AWS_ACCOUNT_ID - AWS Account ID for Billing
#   HUBOT_KANJO_AWS_ACCESS_KEY_ID - AWS Access Key ID for Billing
#   HUBOT_KANJO_AWS_BUCKET_NAME - S3 Bucket name for Billing
#   HUBOT_KANJO_AWS_REGION - Region for S3 Bucket
#   HUBOT_KANJO_AWS_SECRET_KEY - AWS Secret Key for Billing
#
# Author:
#   moqada <moqada@gmail.com>
Kanjo = require 'kanjo'
Table = require 'cli-table'
roundTo = require 'round-to'

PREFIX = 'HUBOT_KANJO_'
AWS_ACCOUNT_ID = process.env["#{PREFIX}AWS_ACCOUNT_ID"]
AWS_ACCESS_KEY_ID = process.env["#{PREFIX}AWS_ACCESS_KEY_ID"]
AWS_BUCKET_NAME = process.env["#{PREFIX}AWS_BUCKET_NAME"]
AWS_REGION = process.env["#{PREFIX}AWS_REGION"]
AWS_SECRET_KEY = process.env["#{PREFIX}AWS_SECRET_KEY"]


module.exports = (robot) ->

  robot.respond /kanjo(?:\s+(?:(\d{4})(0[1-9]|1[0-2])))?$/i, (res) ->
    [year, month] = res.match.slice(1)
    kanjo = new Kanjo({
      account: AWS_ACCOUNT_ID
      bucket: AWS_BUCKET_NAME
      region: AWS_REGION
      accessKeyId: AWS_ACCESS_KEY_ID
      secretAccessKey: AWS_SECRET_KEY
    })
    if year and month
      year = parseInt year, 10
      month = parseInt month, 10
    else
      now = new Date()
      year = now.getFullYear()
      month = now.getMonth() + 1
    kanjo.fetch(year, month).then (report) ->
      output = """
      #{year}/#{month}
      #{outputTable report}
      """
      res.send output
    .catch (err) ->
      console.error err
      res.send "Error: #{err}"


outputTable = (report) ->
  head = ['', 'Consolidated'].concat(report.accounts.map (b) -> b.accountName)
  table = new Table({
    head: head
    chars:
      top: '', 'top-mid': '', 'top-left': '', 'top-right': ''
      bottom: '', 'bottom-mid': '', 'bottom-left': ' ', 'bottom-right': ' '
      left: ' ', 'left-mid': ''
      mid: ' ', 'mid-mid': ' '
      right: '', 'right-mid': ''
      middle: ' '
    style:
      compact: true
      'padding-right': 1
      'padding-left': 0
      head: ['gray']
    colAligns: head.map -> 'right'
  })
  rows = report.total.sortedProducts.map (charge) ->
    code = charge.code
    costs = report.accounts.map (b) ->
      if b.products[code] then b.products[code] else ''
    costs = [charge.cost].concat costs
    ret = {}
    ret[charge.shortCode] = costs.map round
    ret
  totalCosts = [report.total.totalCost].concat(report.accounts.map (b) -> b.totalCost)
  head = {}
  head.Total = totalCosts.map(round)
  [head].concat(rows).forEach (row) -> table.push row
  return table.toString()


round = (num) ->
  if typeof num is 'number'
    return roundTo num, 2
  return num
