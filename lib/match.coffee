{ Status } = require('../index')

class Match

  @MATCH_LENGTH = 90

  constructor: (@system, @home, @away, @moves) ->
    @status = new Status(this)

  getNextMove: ->
    @moves.filter((m) -> m.isValid(@status))[0]

  next: ->
    @getNextMove().perform(@status)
    @status.time++
    @status.isGameOver = @status.time >= Match.MATCH_LENGTH

module.exports = Match
