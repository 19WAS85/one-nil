{ GameSystem } = require('../index')

class MatchAction

  constructor: (@attacker, @blocker) ->

  perform: ->
    success: @attacker.attack > @blocker.defense

module.exports = MatchAction;
