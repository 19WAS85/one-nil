class MatchStep

  constructor: (@gameSystem) ->

  perform: (attacker, blocker) ->
    success: @gameSystem.test(attacker.att, blocker.def)

module.exports = MatchStep;
