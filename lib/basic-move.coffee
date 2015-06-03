class BasicMove

  @INVALID_FIELD = 20
  @FIELD_GAIN = [3.39, 6]

  isValid: (status) -> status.field < BasicMove.INVALID_FIELD

  perform: (status) ->
    if status.testPlayers()
      status.field += @fieldGain(status)
      status.attacker = status.attacker.squad.getPlayer()
      status.blocker = status.blocker.squad.getPlayer()
    else
      status.field = 0
      status.swapPlayers()

  fieldGain: (status) ->
    status.match.system.randBetween(
      BasicMove.FIELD_GAIN[0],
      BasicMove.FIELD_GAIN[1]
    )

module.exports = BasicMove
