expect = require('chai').expect
sinon = require('sinon')

{ MatchContext } = require('../../index')

describe 'MatchContext', ->
  player = player: att: 10
  other = player: def: 12
  keeper = player: gk: 13
  system = null
  match = null
  context = null

  beforeEach ->
    home = players: [player], getPlayer: -> player
    away =
      players: [keeper, other]
      getPlayer: -> other
      getKeeper: -> keeper
    other.squad = away
    system = { }
    match = system: system, home: home, away: away
    context = new MatchContext(match)

  describe '#constructor', ->

    it 'should have time zero', ->
      expect(context.time).to.be.equal(0)

    it 'should have field zero', ->
      expect(context.field).to.be.equal(0)

    it 'should have no game over', ->
      expect(context.isOver).to.be.false

    it 'should have scores zero', ->
      expect(context.score.home).to.be.equal(0)
      expect(context.score.away).to.be.equal(0)

    it 'should select an attacker', ->
      expect(context.attacker).to.be.equal(player)

    it 'should select a blocker', ->
      expect(context.blocker).to.be.equal(other)

  describe '#next', ->

    beforeEach -> context.next()

    it 'should increase time', ->
      expect(context.time).to.be.equal(1)

    it 'should ckeck if match is over', ->
      expect(context.isOver).to.be.false
      context.next() until context.isOver

  describe '#attackerVsBlocker', ->

    beforeEach ->
      system.oneIn = -> false
      system.test = sinon.spy()

    it 'should test attacker against blocker', ->
      context.attackerVsBlocker()
      expect(system.test.calledWith(10, 12)).to.be.true

    describe 'when luck', ->

      beforeEach ->
        system.test = -> false
        system.oneIn = -> true

      it 'should return true', ->
        expect(context.attackerVsBlocker()).to.be.true

  describe '#attackerVsKeeper', ->

    beforeEach ->
      system.oneIn = -> false
      system.test = sinon.spy()

    it 'should get keeper to be the blocker', ->
      context.attackerVsKeeper()
      expect(context.blocker).to.be.equals(keeper)

    it 'should test attacker against keeper', ->
      context.attackerVsKeeper()
      expect(system.test.calledWith(10, 13)).to.be.true

    describe 'when luck', ->

      beforeEach ->
        system.test = -> false
        system.oneIn = -> true

      it 'should return true', ->
        expect(context.attackerVsKeeper()).to.be.true

  describe '#swapPlayers', ->

    beforeEach ->
      context.swapPlayers()

    it 'should switch attacker and blocker', ->
      expect(context.attacker).to.be.equal(other)
      expect(context.blocker).to.be.equal(player)

  describe '#isHomeAttacker', ->

    it 'should be true when attacker is from home squad', ->
      expect(context.isHomeAttacker()).to.be.true

    it 'should be false when attacker is from away squad', ->
      context.swapPlayers()
      expect(context.isHomeAttacker()).to.be.false
