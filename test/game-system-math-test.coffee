expect = require('chai').expect

{ GameSystemMath } = require('../index')

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

  describe '.rand', ->

    it 'should provide a random number between an interval', ->
      limits = loadToGetLimits -> value = GameSystemMath.rand(5, 21)
      expect(limits.min).to.be.equal(5)
      expect(limits.max).to.be.equal(21)

  describe '.r20', ->

    it 'should provide a random numer between 1 and 20', ->
      limits = loadToGetLimits -> value = GameSystemMath.r20()
      expect(limits.min).to.be.equal(1)
      expect(limits.max).to.be.equal(20)
