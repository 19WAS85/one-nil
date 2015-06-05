class Squad

  constructor: (@system, players) ->
    squad = this
    @players = players.map (p) -> player: p, squad: squad

  getPlayer: -> @system.randElement(@players)

module.exports = Squad
