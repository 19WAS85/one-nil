class Finishing

  @FIELD_NEEDED = 20
  @NO_SCORE_FIELD = -5

  isValid: (status) -> status.field >= Finishing.FIELD_NEEDED

  perform: (status) ->
    if status.attackerVsBlocker()
      isHome = status.isHomeAttacker()
      status.score.home++ if isHome
      status.score.away++ unless isHome
      status.field = 0
    else
      status.field += Finishing.NO_SCORE_FIELD

module.exports = Finishing
