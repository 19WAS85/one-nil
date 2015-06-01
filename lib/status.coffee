class Status

  @MATCH_LENGTH = 90

  constructor: (@match) ->
    @time = 0
    @field = 0
    @isGameOver = no
    @score = { home: 0, away: 0 }
    @attacker = @match.system.randElement(@match.home)
    @blocker = @match.system.randElement(@match.away)

  # TODO: create methods to match and moves

  next: ->
    @time++
    @isGameOver = @time >= Status.MATCH_LENGTH

module.exports = Status
