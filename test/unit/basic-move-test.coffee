expect = require('chai').expect
sinon = require('sinon')

{ BasicMove } = require('../../index')

describe 'BasicMove', ->
  move = null

  beforeEach ->
    move = new BasicMove()

  describe '#isValid', ->

    it 'should be valid when field lower than 20', ->
      expect(move.isValid(field: 1)).to.be.true
      expect(move.isValid(field: 19)).to.be.true

    it 'should not be valid when field equal or greater than 20', ->
      expect(move.isValid(field: 20)).to.be.false
      expect(move.isValid(field: 25)).to.be.false

  describe '#perform', ->
    context = null
    attacker = squad: getPlayer: -> 'other'
    blocker = squad: getPlayer: -> 'another'

    beforeEach ->
      context =
        field: 5
        attacker: attacker
        blocker: blocker
        swapPlayers: sinon.spy()
        match: system: randBetween: -> 5

    describe 'when attacker succeed', ->

      beforeEach ->
        context.attackerVsBlocker = -> true
        move.perform(context)

      it 'should move field', ->
        expect(context.field).to.be.equal(10)

      it 'should change attacker', ->
        expect(context.attacker).to.be.equal('other')

      it 'should change blocker', ->
        expect(context.blocker).to.be.equal('another')

    describe 'when blocker succeed', ->

      beforeEach ->
        context.attackerVsBlocker = -> false
        move.perform(context)

      it 'should reset field', ->
        expect(context.field).to.be.equal(0)

      it 'should swap players', ->
        expect(context.swapPlayers.called).to.be.true
