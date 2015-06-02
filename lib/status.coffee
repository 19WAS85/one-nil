class Status

  @MATCH_LENGTH = 90

  constructor: (@match) ->
    @time = 0
    @field = 0
    @isGameOver = no
    @score = { home: 0, away: 0 }
    @attacker = @match.home.getPlayer()
    @blocker = @match.away.getPlayer()

  next: ->
    @time++
    @isGameOver = @time >= Status.MATCH_LENGTH

  testPlayers: ->
    @match.system.test(@attacker.player.att, @blocker.player.def)

module.exports = Status
