class Squad

  constructor: (@system, @team, players) ->
    @players = players.map (p) => player: p, squad: @
    @linePlayers = @players.slice(1, 11)

  getPlayer: -> @system.randElement(@linePlayers)

  getKeeper: -> @players[0]

module.exports = Squad
