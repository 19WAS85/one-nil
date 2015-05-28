class Helpers

  @LOAD_EXECUTION = 1000

  @loadToGetLimits = (func) ->
    max = Number.MIN_VALUE
    min = Number.MAX_VALUE
    for i in [0..@LOAD_EXECUTION]
      do ->
        value = func()
        max = Math.max(value, max)
        min = Math.min(value, min)
    min: min, max: max

module.exports = Helpers
