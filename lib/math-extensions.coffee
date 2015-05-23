class MathExtensions

  constructor: (@container) ->

  rand: (initial, final) ->
    Math.random() * (final - initial) + initial;

  perform: ->
    @container.rand = @rand


module.exports = MathExtensions
