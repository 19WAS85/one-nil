class Helpers

  @LOAD_EXECUTION = 1000

  @MOD_TABLE = [
    [20, 5], [19, 4], [18, 4], [17, 3], [16, 3],
    [15, 2], [14, 2], [13, 1], [12, 1], [11, 0],
    [10, 0], [9, -1], [8, -1], [7, -2], [6, -2],
    [5, -3], [4, -3], [3, -4], [2, -4], [1, -5]
  ]

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
