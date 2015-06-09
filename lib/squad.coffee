class Squad

  constructor: (@system, @team, players) ->
    squad = this
    @players = players.map (p) -> player: p, squad: squad
    @linePlayers = @players.slice(1, 11)

  getPlayer: -> @system.randElement(@linePlayers)

  getKeeper: -> @players[0]

module.exports = Squad
