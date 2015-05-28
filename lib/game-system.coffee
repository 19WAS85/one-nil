class GameSystem

  @MIN_ATTR_VALUE = 1
  @MAX_ATTR_VALUE = 20

  randBetween: (initial, final) ->
    Math.floor(Math.random() * (final - initial + 1) + initial)

  rand: -> @randBetween(GameSystem.MIN_ATTR_VALUE, GameSystem.MAX_ATTR_VALUE)

  mod: (value) -> Math.floor(value / 2 - GameSystem.MAX_ATTR_VALUE / 4)

  test: (attribute, target) ->
    @mod(attribute) + @rand() > GameSystem.MAX_ATTR_VALUE / 2 + @mod(target)

module.exports = GameSystem
