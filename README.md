# hubot-kanjo

[![Greenkeeper badge](https://badges.greenkeeper.io/moqada/hubot-kanjo.svg)](https://greenkeeper.io/)

[![NPM version][npm-image]][npm-url]
[![NPM downloads][npm-download-image]][npm-download-url]
[![Build Status][travis-image]][travis-url]
[![Dependency Status][daviddm-image]][daviddm-url]
[![DevDependency Status][daviddm-dev-image]][daviddm-dev-url]
[![License][license-image]][license-url]

Summarize AWS Billing for Hubot.


## Installation

```
npm install hubot-kanjo --save
```

Then add **hubot-kanjo** to your `external-scripts.json`:

```json
["hubot-kanjo"]
```

## Sample Interaction


## Commands

```
hubot kanjo - Show AWS Billing of current month
hubot kanjo <YYYYMM> - Show AWS Billing of target month
```

## Configurations

```
HUBOT_KANJO_AWS_ACCOUNT_ID - AWS Account ID for Billing
HUBOT_KANJO_AWS_ACCESS_KEY_ID - AWS Access Key ID for Billing
HUBOT_KANJO_AWS_BUCKET_NAME - S3 Bucket name for Billing
HUBOT_KANJO_AWS_REGION - Region for S3 Bucket
HUBOT_KANJO_AWS_SECRET_KEY - AWS Secret Key for Billing
```


## Related

- [kanjo](https://github.com/moqada/kanjo) - API for this module
- [kanjo-cli](https://github.com/moqada/kanjo-cli) - CLI for this module


[npm-url]: https://www.npmjs.com/package/hubot-kanjo
[npm-image]: https://img.shields.io/npm/v/hubot-kanjo.svg?style=flat-square
[npm-download-url]: https://www.npmjs.com/package/hubot-kanjo
[npm-download-image]: https://img.shields.io/npm/dt/hubot-kanjo.svg?style=flat-square
[travis-url]: https://travis-ci.org/moqada/hubot-kanjo
[travis-image]: https://img.shields.io/travis/moqada/hubot-kanjo.svg?style=flat-square
[daviddm-url]: https://david-dm.org/moqada/hubot-kanjo
[daviddm-image]: https://img.shields.io/david/moqada/hubot-kanjo.svg?style=flat-square
[daviddm-dev-url]: https://david-dm.org/moqada/hubot-kanjo#info=devDependencies
[daviddm-dev-image]: https://img.shields.io/david/dev/moqada/hubot-kanjo.svg?style=flat-square
[license-url]: http://opensource.org/licenses/MIT
[license-image]: https://img.shields.io/npm/l/hubot-kanjo.svg?style=flat-square
