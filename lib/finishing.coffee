class Finishing

  @FIELD_NEEDED = 20

  isValid: (status) -> status.field >= Finishing.FIELD_NEEDED

  perform: (status) ->
    if status.testPlayers()
      isHome = status.isHomeAttacker()
      status.score.home++ if isHome
      status.score.away++ unless isHome


module.exports = Finishing
