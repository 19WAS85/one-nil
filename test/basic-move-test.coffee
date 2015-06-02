expect = require('chai').expect
sinon = require('sinon')

{ BasicMove } = require('../index')

describe 'BasicMove', ->
  move = null

  beforeEach ->
    move = new BasicMove()

  describe '#isValid', ->

    it 'should be valid when field < 20', ->
      expect(move.isValid(field: 1)).to.be.true
      expect(move.isValid(field: 19)).to.be.true

    it 'should not be valid when field >= 20', ->
      expect(move.isValid(field: 20)).to.be.false
      expect(move.isValid(field: 25)).to.be.false

  describe '#perform', ->

    describe 'when attacker succeed', ->
      status = null

      beforeEach ->
        status = field: 0,
        testPlayers: sinon.spy(-> true),
        attacker: { squad: { getPlayer: -> 'other' } }

      it 'should move field', ->
        move.perform(status)
        expect(status.field).to.be.equal(5)

      it 'should change attacker', ->
        move.perform(status)
        expect(status.attacker).to.be.equal('other')

    describe 'when blocker succeed', ->

      it 'should reset field'
      it 'should swap players'
