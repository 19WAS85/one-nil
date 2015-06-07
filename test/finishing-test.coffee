expect = require('chai').expect

{ Finishing } = require('../index')

describe 'Finishing', ->
  move = new Finishing()

  describe '#isValid', ->

    it 'should be true when field is equals or greater than 20', ->
      expect(move.isValid(field: 20)).to.be.true
      expect(move.isValid(field: 23)).to.be.true

    it 'should be false when field is lower than 20', ->
      expect(move.isValid(field: 19)).to.be.false
      expect(move.isValid(field: 15)).to.be.false

  describe '#perform', ->
    status = null

    beforeEach ->
      attacker = 'player'
      status = field: 10, score: home: 0, away: 0

    describe 'when home attackers success', ->

      beforeEach ->
        status.isHomeAttacker = -> true
        status.attackerVsBlocker = -> true
        move.perform(status)

      it 'should increase score value to home', ->
        expect(status.score.home).to.be.equals(1)
        expect(status.score.away).to.be.equals(0)

    describe 'when away attackers success', ->

      beforeEach ->
        status.isHomeAttacker = -> false
        status.attackerVsBlocker = -> true
        move.perform(status)

      it 'should increase score value to away', ->
        expect(status.score.home).to.be.equals(0)
        expect(status.score.away).to.be.equals(1)

      it 'should reset field', ->
        expect(status.field).to.be.equals(0)

    describe 'when blocker success', ->

      beforeEach ->
        status.attackerVsBlocker = -> false
        move.perform(status)

      it 'should not increase score value', ->
        expect(status.score.home).to.be.equals(0)
        expect(status.score.away).to.be.equals(0)

      it 'should decrease field in 5', ->
        expect(status.field).to.be.equals(5)
