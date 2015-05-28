expect = require('chai').expect

{ Match } = require('../index')

describe 'Match', ->
  match = new Match()

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

    it 'should provide field'
    it 'should provide attacker'
    it 'should provide blocker'
    it 'should provide score'
