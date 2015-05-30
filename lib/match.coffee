class Match

  @MATCH_LENGTH = 90

  constructor: (@home, @away, @moves) ->
    @status =
      time: 0
      field: 0
      isGameOver: no
      score: { home: 0, away: 0 }
      attacker: @home[0]
      blocker: @away[0]

  getNextMove: ->
    @moves.filter((m) -> m.isValid(@status))[0]

  next: ->
    @getNextMove().perform(@status)
    @status.time++
    @status.isGameOver = @status.time >= Match.MATCH_LENGTH

module.exports = Match
