class BasicMove

  @INVALID_FIELD = 20
  @FIELD_GAIN = [5, 7]

  isValid: (context) -> context.field < BasicMove.INVALID_FIELD

  perform: (context) ->
    if context.attackerVsBlocker()
      context.field += @fieldGain(context)
      context.attacker = context.attacker.squad.getPlayer()
      context.blocker = context.blocker.squad.getPlayer()
    else
      context.field = 0
      context.swapPlayers()

  fieldGain: (context) ->
    context.match.system.randBetween(
      BasicMove.FIELD_GAIN[0],
      BasicMove.FIELD_GAIN[1])

module.exports = BasicMove
