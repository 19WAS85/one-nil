class MathUtil

  constructor: (@container) ->
    @randomProvider = Math.random

  rand: (initial, final) ->
    random = @randomProvider()
    Math.floor(random * (final - initial + 1) + initial)

  r20: -> @rand(1, 20)

  perform: ->
    @container.randomProvider = @randomProvider
    @container.rand = @rand
    @container.r20 = @r20

module.exports = MathUtil
