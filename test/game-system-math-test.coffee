expect = require('chai').expect

{ GameSystem, GameSystemMath } = require('../index')

LOAD_EXECUTION = 1000

loadToGetLimits = (func) ->
  max = Number.MIN_VALUE
  min = Number.MAX_VALUE
  for i in [0..LOAD_EXECUTION]
    do ->
      value = func()
      max = Math.max(value, max)
      min = Math.min(value, min)
  min: min, max: max

describe 'GameSystemMath', ->

  describe '.randBetween', ->

    it 'should provide a random number between an interval', ->
      limits = loadToGetLimits -> value = GameSystemMath.randBetween(5, 21)
      expect(limits.min).to.be.equal(5)
      expect(limits.max).to.be.equal(21)

  describe '.rand', ->

    it 'should provide a random number between min and max attribute value', ->
      limits = loadToGetLimits -> value = GameSystemMath.rand()
      expect(limits.min).to.be.equal(GameSystem.MIN_ATTR_VALUE)
      expect(limits.max).to.be.equal(GameSystem.MAX_ATTR_VALUE)
