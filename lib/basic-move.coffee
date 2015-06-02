class BasicMove

  @INVALID_FIELD = 20
  @FIELD_GAIN = 5

  isValid: (status) -> status.field < BasicMove.INVALID_FIELD

  perform: (status) ->
    if status.testPlayers()
      status.field += BasicMove.FIELD_GAIN
      status.attacker = status.attacker.squad.getPlayer()

module.exports = BasicMove
