expect = require('chai').expect

{ Status, GameSystem, Match } = require('../index')

describe 'Status', ->

  describe '#constructor', ->
    player = att: 12, def: 8
    status = null
    system = null

    beforeEach ->
      system = new GameSystem()
      system.randElement = -> player
      match = new Match(system)
      status = new Status(match)

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
