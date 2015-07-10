expect = require('chai').expect

{ Finishing } = require('../../index')

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
    context = null

    beforeEach ->
      attacker = 'player'
      context = field: 10, score: home: 0, away: 0

    describe 'when home attackers success', ->

      beforeEach ->
        context.isHomeAttacker = -> true
        context.attackerVsKeeper = -> true
        move.perform(context)

      it 'should increase score value to home', ->
        expect(context.score.home).to.be.equals(1)
        expect(context.score.away).to.be.equals(0)

    describe 'when away attackers success', ->

      beforeEach ->
        context.isHomeAttacker = -> false
        context.attackerVsKeeper = -> true
        move.perform(context)

      it 'should increase score value to away', ->
        expect(context.score.home).to.be.equals(0)
        expect(context.score.away).to.be.equals(1)

      it 'should reset field', ->
        expect(context.field).to.be.equals(0)

    describe 'when blocker success', ->

      beforeEach ->
        context.attackerVsKeeper = -> false
        move.perform(context)

      it 'should not increase score value', ->
        expect(context.score.home).to.be.equals(0)
        expect(context.score.away).to.be.equals(0)

      it 'should decrease field in 5', ->
        expect(context.field).to.be.equals(5)
