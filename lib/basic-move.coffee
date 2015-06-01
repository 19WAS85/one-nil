class BasicMove

  @INVALID_FIELD = 20
  @FIELD_GAIN = 5

  constructor: (@gameSystem) ->

  isValid: (status) -> status.field < BasicMove.INVALID_FIELD

  perform: (status) ->
    if @gameSystem.test(status.attacker.player.att, status.blocker.player.def)
      status.field += BasicMove.FIELD_GAIN
      status.attacker = @gameSystem.randElement(status.attacker.squad.players)

module.exports = BasicMove
