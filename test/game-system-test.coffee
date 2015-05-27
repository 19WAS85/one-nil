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
  system = null

  beforeEach -> system = new GameSystem()

  describe 'constants', ->

    it 'should have max attribute value', ->
      expect(GameSystem.MAX_ATTR_VALUE).to.be.equal(20)

    it 'should have min attribute value', ->
      expect(GameSystem.MIN_ATTR_VALUE).to.be.equal(1)

  describe '#randBetween', ->

    it 'should return a random number between an interval', ->
      limits = loadToGetLimits -> value = system.randBetween(5, 21)
      expect(limits.min).to.be.equal(5)
      expect(limits.max).to.be.equal(21)

  describe '#rand', ->

    it 'should return a random number between min and max attribute value', ->
      limits = loadToGetLimits -> value = system.rand()
      expect(limits.min).to.be.equal(GameSystem.MIN_ATTR_VALUE)
      expect(limits.max).to.be.equal(GameSystem.MAX_ATTR_VALUE)

  describe '#attrMod', ->

    it 'should return the modificator of an attribute value', ->
      expect(system.mod(20)).to.be.equal(5)
      expect(system.mod(19)).to.be.equal(4)
      expect(system.mod(11)).to.be.equal(0)
      expect(system.mod(10)).to.be.equal(0)
      expect(system.mod(7)).to.be.equal(-2)
      expect(system.mod(1)).to.be.equal(-5)

  describe '#test', ->

    describe 'in perfect conditions', ->

      beforeEach -> system.rand = -> GameSystem.MAX_ATTR_VALUE

      it 'should be success when attribute is better', ->
        expect(system.test(10, 8)).to.be.true
        expect(system.test(15, 5)).to.be.true
        expect(system.test(20, 1)).to.be.true

      it 'should be success when target is higher', ->
        expect(system.test(8, 10)).to.be.true
        expect(system.test(5, 15)).to.be.true

      it 'should not be success when attr is the worst againt max target', ->
        expect(system.test(1, 20)).to.be.false

    describe 'in worst conditions', ->

      beforeEach -> system.rand = -> GameSystem.MIN_ATTR_VALUE

      it 'should not be success when attribute is better', ->
        expect(system.test(10, 8)).to.be.false
        expect(system.test(15, 5)).to.be.false

      it 'should not be success when target is higher', ->
        expect(system.test(8, 10)).to.be.false
        expect(system.test(5, 15)).to.be.false
        expect(system.test(1, 20)).to.be.false

      it 'should be success when attr is max againt worst target', ->
        expect(system.test(20, 1)).to.be.true
