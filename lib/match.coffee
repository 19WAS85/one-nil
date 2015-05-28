class Match

  @MATCH_LENGTH = 90

  constructor: ->
    @status =
      time: 0
      isGameOver: no

  next: ->
    @status.time++
    @status.isGameOver = @status.time >= Match.MATCH_LENGTH

module.exports = Match
