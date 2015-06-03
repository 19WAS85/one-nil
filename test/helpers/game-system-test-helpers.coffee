class Helpers

  @LOAD_SIZE = 1000

  @MOD_TABLE = [
    [20, 5], [19, 4], [18, 4], [17, 3], [16, 3],
    [15, 2], [14, 2], [13, 1], [12, 1], [11, 0],
    [10, 0], [9, -1], [8, -1], [7, -2], [6, -2],
    [5, -3], [4, -3], [3, -4], [2, -4], [1, -5]
  ]

  @loadToGetLimits: (func) ->
    results = @load(func)
    min: Math.min.apply(Math, results), max: Math.max.apply(Math, results)

  @loadPercentOfTrue: (func) ->
    results = @load(func)
    results.filter((e) -> e).length / results.length

  @load: (func) -> [0..@LOAD_SIZE].map -> func()

module.exports = Helpers
