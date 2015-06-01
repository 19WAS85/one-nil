expect = require('chai').expect

{ BasicMove, GameSystem, Squad } = require('../index')

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
      attacker = att: 20
      otherAttacker = att: 19
      blocker = def: 1
      status = null

      beforeEach ->
        homeSquad = new Squad(system, [attacker, otherAttacker])
        awaySquad = new Squad(system, [blocker])
        status =
          field: 0,
          attacker: homeSquad.players[0],
          blocker: awaySquad.getPlayer()
        system.rand = -> 20
        system.randElement = -> homeSquad.players[1]

      it 'should move field', ->
        move.perform(status)
        expect(status.field).to.be.equal(5)

      it 'should change attacker', ->
        expect(status.attacker.player).to.be.equal(attacker)
        move.perform(status)
        expect(status.attacker.player).to.be.equal(otherAttacker)

    describe 'when blocker succeed', ->

      it 'should reset field'
      it 'should swap players'
