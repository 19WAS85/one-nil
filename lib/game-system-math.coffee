class GameSystemMath

  @rand: (initial, final) ->
    Math.floor(Math.random() * (final - initial + 1) + initial)

  @r20: -> @rand(1, 20)

module.exports = GameSystemMath
