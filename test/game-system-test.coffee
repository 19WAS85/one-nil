expect = require('chai').expect

{ GameSystem } = require('../index')

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

describe 'GameSystem', ->

  describe 'constants', ->

    it 'should have max attribute value', ->
      expect(GameSystem.MAX_ATTR_VALUE).to.be.equal(20)

    it 'should have min attribute value', ->
      expect(GameSystem.MIN_ATTR_VALUE).to.be.equal(1)

  describe '.randBetween', ->

    it 'should return a random number between an interval', ->
      limits = loadToGetLimits -> value = GameSystem.randBetween(5, 21)
      expect(limits.min).to.be.equal(5)
      expect(limits.max).to.be.equal(21)

  describe '.rand', ->

    it 'should return a random number between min and max attribute value', ->
      limits = loadToGetLimits -> value = GameSystem.rand()
      expect(limits.min).to.be.equal(GameSystem.MIN_ATTR_VALUE)
      expect(limits.max).to.be.equal(GameSystem.MAX_ATTR_VALUE)

  describe '.attrMod', ->

    it 'should return the modificator of an attribute value', ->
      expect(GameSystem.mod(20)).to.be.equal(5)
      expect(GameSystem.mod(19)).to.be.equal(4)
      expect(GameSystem.mod(11)).to.be.equal(0)
      expect(GameSystem.mod(10)).to.be.equal(0)
      expect(GameSystem.mod(7)).to.be.equal(-2)
      expect(GameSystem.mod(1)).to.be.equal(-5)
