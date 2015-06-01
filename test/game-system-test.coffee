expect = require('chai').expect
Helpers = require('./helpers/game-system-test-helpers')

{ GameSystem } = require('../index')

describe 'GameSystem', ->
  system = null

  beforeEach -> system = new GameSystem()

  describe 'constants', ->

    it 'should have max attribute value', ->
      expect(GameSystem.MAX_ATTR).to.be.equal(20)

    it 'should have min attribute value', ->
      expect(GameSystem.MIN_ATTR).to.be.equal(1)

  describe '#randBetween', ->

    it 'should return a random number between an interval', ->
      limits = Helpers.loadToGetLimits -> system.randBetween(5, 21)
      expect(limits.min).to.be.equal(5)
      expect(limits.max).to.be.equal(21)

  describe '#rand', ->

    it 'should return a random number between min and max attribute value', ->
      limits = Helpers.loadToGetLimits -> system.rand()
      expect(limits.min).to.be.equal(GameSystem.MIN_ATTR)
      expect(limits.max).to.be.equal(GameSystem.MAX_ATTR)

  describe '#attrMod', ->

    it 'should return the modificator of an attribute value', ->
      Helpers.MOD_TABLE.forEach (e) ->
        expect(system.mod(e[0])).to.be.equal(e[1])

  describe '#test', ->

    describe 'in perfect conditions', ->

      beforeEach -> system.rand = -> GameSystem.MAX_ATTR

      it 'should be success when attribute is better', ->
        expect(system.test(10, 9)).to.be.true
        expect(system.test(20, 1)).to.be.true

      it 'should be success when target is higher', ->
        expect(system.test(9, 10)).to.be.true
        expect(system.test(2, 20)).to.be.true

      it 'should not be success when attr is the worst againt max target', ->
        expect(system.test(1, 20)).to.be.false

    describe 'in worst conditions', ->

      beforeEach -> system.rand = -> GameSystem.MIN_ATTR

      it 'should not be success when attribute is better', ->
        expect(system.test(10, 9)).to.be.false
        expect(system.test(20, 2)).to.be.false

      it 'should not be success when target is higher', ->
        expect(system.test(1, 20)).to.be.false
        expect(system.test(9, 10)).to.be.false

      it 'should be success when attr is max againt worst target', ->
        expect(system.test(20, 1)).to.be.true

  describe '#randElement', ->

    it 'should return a random element of an array', ->
      limits = Helpers.loadToGetLimits -> system.randElement([1, 2, 3])
      expect(limits.min).to.be.equal(1)
      expect(limits.max).to.be.equal(3)
