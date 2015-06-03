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
    status = null
    attacker = squad: getPlayer: -> 'other'
    blocker = squad: getPlayer: -> 'another'

    beforeEach ->
      status =
        field: 5
        attacker: attacker
        blocker: blocker
        swapPlayers: sinon.spy()

    describe 'when attacker succeed', ->

      beforeEach ->
        status.testPlayers = -> true
        move.perform(status)

      it 'should move field', ->
        expect(status.field).to.be.equal(10)

      it 'should change attacker', ->
        expect(status.attacker).to.be.equal('other')

      it 'should change blocker', ->
        expect(status.blocker).to.be.equal('another')

    describe 'when blocker succeed', ->

      beforeEach ->
        status.testPlayers = -> false
        move.perform(status)

      it 'should reset field', ->
        expect(status.field).to.be.equal(0)

      it 'should swap players', ->
        expect(status.swapPlayers.called).to.be.true
