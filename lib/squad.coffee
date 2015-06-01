class Squad

  constructor: (@gameSystem, players) ->
    squad = this
    @players = players.map (p) -> player: p, squad: squad

  getPlayer: -> @gameSystem.randElement(@players)

module.exports = Squad
