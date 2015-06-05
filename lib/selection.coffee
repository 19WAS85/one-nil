{ Squad } = require('../index')

class Selection

  @PLAYERS_SIZE = 11

  constructor: (@system, @players) ->

  createSquad: ->
    new Squad(@system, @players.slice(0, Selection.PLAYERS_SIZE))

module.exports = Selection
