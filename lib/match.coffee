{ Status } = require('../index')

class Match

  constructor: (@system, @home, @away, @moves) ->
    @status = new Status(this)

  getNextMove: ->
    status = @status
    @moves.filter((m) -> m.isValid(status))[0]

  next: ->
    @getNextMove().perform(@status)
    @status.next()

module.exports = Match
