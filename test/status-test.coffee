expect = require('chai').expect

{ Status, GameSystem, Match, Squad } = require('../index')

describe 'Status', ->
  player = att: 12, def: 8
  status = null
  system = null

  beforeEach ->
    system = new GameSystem()
    squad = new Squad(system, [])
    match = new Match(system, squad, squad)
    system.randElement = -> player
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
      expect(status.blocker).to.be.equal(player)

  describe '#next', ->

    beforeEach -> status.next()

    it 'should increase time', ->
      expect(status.time).to.be.equal(1)

    it 'should ckeck if match is over', ->
      expect(status.isGameOver).to.be.false
      status.next() until status.isGameOver

  describe '#testPlayers', ->

    beforeEach ->
      system.rand = -> 20
      status.attacker = player: { att: 20 }
      status.blocker = player: { def: 1 }

    it 'should test attacker against blocker', ->
      expect(status.testPlayers()).to.be.true

  describe '#swapPlayers', ->

    beforeEach ->
      status.attacker = 'player'
      status.blocker = 'other'
      status.swapPlayers()

    it 'should switch attacker and blocker', ->
      expect(status.attacker).to.be.equal('other')
      expect(status.blocker).to.be.equal('player')
