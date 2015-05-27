expect = require('chai').expect

{ GameSystem } = require('../index')

describe 'GameSystem', ->

  describe 'constants', ->

    it 'should have max attribute value', ->
      expect(GameSystem.MAX_ATTR_VALUE).to.be.equal(20)

    it 'should have min attribute value', ->
      expect(GameSystem.MIN_ATTR_VALUE).to.be.equal(1)

module.exports = GameSystem
