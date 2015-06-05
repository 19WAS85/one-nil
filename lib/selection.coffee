{ Squad } = require('../index')

class Selection

  @PLAYERS_SIZE = 11

  constructor: (@system, @players) ->

  createSquad: ->
    attackers = @slicedPlayersBy(5, (p) -> p.att).reverse()
    blockers = @slicedPlayersBy(6, (p) -> p.def).reverse()
    new Squad(@system, blockers.concat(attackers))

  slicedPlayersBy: (size, func) -> @allPlayersBy(func).slice(0, size)

  allPlayersBy: (func) -> @players.sort((a, b) -> func(b) - func(a))

module.exports = Selection
