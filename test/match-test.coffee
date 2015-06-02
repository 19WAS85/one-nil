expect = require('chai').expect
sinon = require('sinon')
Helpers = require('./helpers/player-helpers')

{ Match, GameSystem, Squad } = require('../index')

describe 'Match', ->
  system = new GameSystem()
  home = new Squad(system, Helpers.createPlayers('A', 15))
  away = new Squad(system, Helpers.createPlayers('B', 5))
  move = null
  match = null

  beforeEach ->
    move = isValid: sinon.spy(-> yes), perform: sinon.spy()
    match = new Match(system, home, away, [move])

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
      expect(match.status.attacker.player.name).to.contain('A')

    it 'should provide blocker', ->
      match.next()
      expect(match.status.blocker.player.name).to.contain('B')

    it 'should provide field', ->
      move.perform = (status) -> status.field++
      match.next()
      expect(match.status.field).to.be.equal(1)

    it 'should select a valid move to play', ->
      match.next()
      expect(move.isValid.called).to.be.true

    it 'should play selected move', ->
      match.next()
      expect(move.perform.called).to.be.true

    it 'should provide score', ->
      move.perform = (status) -> status.score.home++
      match.next()
      expect(match.status.score.home).to.be.equal(1)
      expect(match.status.score.away).to.be.equal(0)
