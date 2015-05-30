class Match

  @MATCH_LENGTH = 90

  constructor: (@home, @away, @moves) ->
    @status = time: 0, field: 0, isGameOver: no

  getNextMove: ->
    @moves.filter((m) -> m.isValid(@status))[0]

  next: ->
    @getNextMove().perform(@status)
    @status.time++
    @status.field++;
    @status.attacker = @home[0]
    @status.blocker = @away[0]
    @status.isGameOver = @status.time >= Match.MATCH_LENGTH

module.exports = Match
