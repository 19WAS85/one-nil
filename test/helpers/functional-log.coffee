winston = require('winston')
winston.emitErrs = true

infoFileTransport = new winston.transports.File(
  level: 'info'
  filename: 'functional-test.log'
  json: false)

logger = new winston.Logger(
  transports: [infoFileTransport]
  exitOnError: false)

module.exports = (testName) ->
  logger.info("----------------------------------------------")
  logger.info(" #{testName}")
  logger.info("----------------------------------------------")
  logger
