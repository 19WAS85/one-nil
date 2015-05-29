class Match

  @MATCH_LENGTH = 90

  constructor: (@home, @away) ->
    @status =
      time: 0
      field: 0
      isGameOver: no

  next: ->
    @status.time++
    @status.field++;
    @status.attacker = @home[0]
    @status.blocker = @away[0]
    @status.isGameOver = @status.time >= Match.MATCH_LENGTH

module.exports = Match
