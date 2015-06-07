expect = require('chai').expect
sinon = require('sinon')

{ Status } = require('../index')

describe 'Status', ->
  player = player: att: 10
  other = player: def: 12
  system = null
  match = null
  status = null

  beforeEach ->
    home = players: [player], getPlayer: -> player
    away = players: [other], getPlayer: -> other
    system = { }
    match = system: system, home: home, away: away
    status = new Status(match)

  describe '#constructor', ->

    it 'should have time zero', ->
      expect(status.time).to.be.equal(0)

    it 'should have field zero', ->
      expect(status.field).to.be.equal(0)

    it 'should have no game over', ->
      expect(status.isGameOver).to.be.false

    it 'should have scores zero', ->
      expect(status.score.home).to.be.equal(0)
      expect(status.score.away).to.be.equal(0)

    it 'should select an attacker', ->
      expect(status.attacker).to.be.equal(player)

    it 'should select a blocker', ->
      expect(status.blocker).to.be.equal(other)

  describe '#next', ->

    beforeEach -> status.next()

    it 'should increase time', ->
      expect(status.time).to.be.equal(1)

    it 'should ckeck if match is over', ->
      expect(status.isGameOver).to.be.false
      status.next() until status.isGameOver

  describe '#attackerVsBlocker', ->

    beforeEach ->
      system.oneIn = -> false
      system.test = sinon.spy()

    it 'should test attacker against blocker', ->
      status.attackerVsBlocker()
      expect(system.test.called).to.be.true

    describe 'when luck', ->

      beforeEach ->
        system.test = -> false
        system.oneIn = -> true

      it 'should return true', ->
        expect(status.attackerVsBlocker()).to.be.true

  describe '#swapPlayers', ->

    beforeEach ->
      status.swapPlayers()

    it 'should switch attacker and blocker', ->
      expect(status.attacker).to.be.equal(other)
      expect(status.blocker).to.be.equal(player)

  describe '#isHomeAttacker', ->

    it 'should be true when attacker is from home squad', ->
      expect(status.isHomeAttacker()).to.be.true

    it 'should be false when attacker is from away squad', ->
      status.swapPlayers()
      expect(status.isHomeAttacker()).to.be.false
