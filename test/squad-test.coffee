expect = require('chai').expect
sinon = require('sinon')

{ Squad } = require('../index')

describe 'Squad', ->
  system = null
  squad = null

  beforeEach ->
    players = [{ }, { }]
    system = randElement: sinon.spy()
    squad = new Squad(system, players)

  describe '#players', ->

    it 'should have a list of players', ->
      expect(squad.players.length).to.be.equal(2)

    it 'each player should references squad', ->
      expect(squad.players[0].squad).to.be.equal(squad)
      expect(squad.players[1].squad).to.be.equal(squad)

  describe '#getPlayer', ->

    it 'should return an player', ->
      squad.getPlayer()
      expect(system.randElement.calledWith(squad.players)).to.be.true
