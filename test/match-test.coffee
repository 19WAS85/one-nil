expect = require('chai').expect
sinon = require('sinon')

{ Match } = require('../index')

describe 'Match', ->
  move = null
  home = null
  away = null
  match = null

  beforeEach ->
    system = { }
    home =
      getPlayer: -> 'player'
      updateStats: sinon.spy()
    away =
      getPlayer: -> 'other'
      updateStats: sinon.spy()
    move = isValid: sinon.spy(-> yes), perform: sinon.spy()
    match = new Match(system, home, away, [move])

  describe '#next', ->

    it 'should provide time', ->
      expect(match.status.time).to.be.equal(0)
      match.next()
      expect(match.status.time).to.be.equal(1)

    it 'should provide attacker', ->
      match.next()
      expect(match.status.attacker).to.be.equal('player')

    it 'should provide blocker', ->
      match.next()
      expect(match.status.blocker).to.contain('other')

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

    describe 'when the match is over', ->

      it 'should provide end of match', ->
        expect(match.status.isOver).to.be.false
        match.simulate()
        expect(match.status.isOver).to.be.true

      it 'should end at 90 minutes', ->
        match.simulate()
        expect(match.status.time).to.be.equal(90)

      it 'should update league stats', ->
        match.simulate()
        expect(home.updateStats.calledOnce).to.be.true
        expect(away.updateStats.calledOnce).to.be.true


  describe '#simulate', ->

    beforeEach -> match.simulate()

    it 'should provide the end of the match', ->
      expect(match.status.isOver).to.be.true
      expect(match.status.time).to.be.equal(90)
