class BasicMove

  @INVALID_FIELD = 20
  @FIELD_GAIN = 7.5

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
    status.match.system.randBetween(5, BasicMove.FIELD_GAIN)

module.exports = BasicMove
