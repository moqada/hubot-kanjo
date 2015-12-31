Helper = require 'hubot-test-helper'
assert = require 'power-assert'

describe 'kanjo', ->
  room = null

  beforeEach ->
    helper = new Helper('../src/scripts/kanjo.coffee')
    room = helper.createRoom()

  afterEach ->
    room.destroy()

  it 'help', ->
    helps = room.robot.helpCommands()
    assert.deepEqual helps, [
      'hubot kanjo - Show AWS Billing of current month'
      'hubot kanjo <YYYYMM> - Show AWS Billing of target month'
    ]
