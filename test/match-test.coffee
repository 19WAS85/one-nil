expect = require('chai').expect
Helpers = require('./helpers/match-test-helpers')

{ Match } = require('../index')

describe 'Match', ->
  home = Helpers.createPlayers('A', 15)
  away = Helpers.createPlayers('B', 5)
  match = new Match(home, away)

  describe '#next', ->

    it 'should provide time', ->
      expect(match.status.time).to.be.equal(0)
      match.next()
      expect(match.status.time).to.be.equal(1)

    it 'should provide end of match', ->
      expect(match.status.isGameOver).to.be.false
      match.next() until match.status.isGameOver
      expect(match.status.isGameOver).to.be.true

    it 'should end at 90 minutes', ->
      match.next() until match.status.isGameOver
      expect(match.status.time).to.be.equal(90)

    it 'should provide attacker', ->
      match.next()
      expect(match.status.attacker.name).to.contain('A')

    it 'should provide blocker', ->
      match.next()
      expect(match.status.blocker.name).to.contain('B')

    it 'should provide field'
    it 'should provide score'
