class Action

  constructor: (@attacker, @blocker) ->

  perform: ->
    { success: @attacker.attack > @blocker.defense }

module.exports = Action;
