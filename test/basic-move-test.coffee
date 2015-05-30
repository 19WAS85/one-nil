expect = require('chai').expect

{ BasicMove, GameSystem } = require('../index')

describe 'BasicMove', ->
  system = null
  move = null

  beforeEach ->
    system = new GameSystem()
    move = new BasicMove(system)

  describe '#isValid', ->

    it 'should be valid when field < 20', ->
      expect(move.isValid(field: 1)).to.be.true
      expect(move.isValid(field: 19)).to.be.true

    it 'should not be valid when field >= 20', ->
      expect(move.isValid(field: 20)).to.be.false
      expect(move.isValid(field: 25)).to.be.false

  describe '#perform', ->

    describe 'when attacker succeed', ->

      beforeEach -> system.rand = -> 20

      it 'should move field', ->
        status = field: 0, attacker: { att: 20 }, blocker: { def: 1 }
        move.perform(status)
        expect(status.field).to.be.equal(1)

      it 'should change attacker'

    describe 'when blocker succeed', ->

      it 'should reset field'
      it 'should swap players'
