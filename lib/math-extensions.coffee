class MathExtensions

  constructor: (@container) ->

  rand: (initial, final) ->
    Math.floor(Math.random() * (final - initial + 1) + initial)

  r20: -> @rand(1, 20)

  perform: ->
    @container.rand = @rand
    @container.r20 = @r20


module.exports = MathExtensions
