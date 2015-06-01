class Status

  constructor: (@match) ->
    @time = 0
    @field = 0
    @isGameOver = no
    @score = { home: 0, away: 0 }
    @attacker = @match.system.randElement(@match.home)
    @blocker = @match.system.randElement(@match.away)

module.exports = Status
