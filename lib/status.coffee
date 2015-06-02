class Status

  @MATCH_LENGTH = 90

  constructor: (@match) ->
    @time = 0
    @field = 0
    @isGameOver = no
    @score = { home: 0, away: 0 }
    @attacker = @match.home.getPlayer()
    @blocker = @match.away.getPlayer()

  # TODO: create methods to match and moves

  next: ->
    @time++
    @isGameOver = @time >= Status.MATCH_LENGTH

module.exports = Status
