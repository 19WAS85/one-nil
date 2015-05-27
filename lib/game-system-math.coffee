{ GameSystem } = require('../index')

class GameSystemMath

  @randBetween: (initial, final) ->
    Math.floor(Math.random() * (final - initial + 1) + initial)

  @rand: -> @randBetween(GameSystem.MIN_ATTR_VALUE, GameSystem.MAX_ATTR_VALUE)

module.exports = GameSystemMath
