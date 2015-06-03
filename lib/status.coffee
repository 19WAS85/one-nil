class Status

  @MATCH_LENGTH = 90
  @PLAYERS_LUCK = 5

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
    @match.system.oneIn(Status.PLAYERS_LUCK) or
      @match.system.test(@attacker.player.att, @blocker.player.def)

  swapPlayers: ->
    aux = @attacker
    @attacker = @blocker
    @blocker = aux

  isHomeAttacker: -> @match.home.players.indexOf(@attacker) != -1

module.exports = Status
