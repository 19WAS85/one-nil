class GameSystem

  @MIN_ATTR_VALUE = 1
  @MAX_ATTR_VALUE = 20

  @randBetween: (initial, final) ->
    Math.floor(Math.random() * (final - initial + 1) + initial)

  @rand: -> @randBetween(@MIN_ATTR_VALUE, @MAX_ATTR_VALUE)

module.exports = GameSystem
