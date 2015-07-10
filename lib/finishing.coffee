class Finishing

  @FIELD_NEEDED = 20
  @NO_SCORE_FIELD = -5

  isValid: (context) -> context.field >= Finishing.FIELD_NEEDED

  perform: (context) ->
    if context.attackerVsKeeper()
      isHome = context.isHomeAttacker()
      context.score.home++ if isHome
      context.score.away++ unless isHome
      context.field = 0
    else
      context.field += Finishing.NO_SCORE_FIELD

module.exports = Finishing
