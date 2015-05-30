class BasicMove

  @INVALID_FIELD = 20

  constructor: (@gameSystem) ->

  isValid: (status) -> status.field < BasicMove.INVALID_FIELD

  perform: (status) ->
    if @gameSystem.test(status.attacker.att, status.blocker.def)
      status.field++

module.exports = BasicMove
