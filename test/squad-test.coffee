expect = require('chai').expect
sinon = require('sinon')

{ Squad } = require('../index')

describe 'Squad', ->
  system = null
  squad = null

  beforeEach ->
    team = players: []
    players = [name: 'P1']
    [2..11].forEach (i) -> players.push(name: "P#{i}")
    system = randElement: sinon.spy()
    squad = new Squad(system, team, players)

  describe 'constructor', ->

    it 'should have a list of players', ->
      expect(squad.players.length).to.be.equal(11)

    it 'each player should references squad', ->
      expect(squad.players[0].squad).to.be.equal(squad)
      expect(squad.players[1].squad).to.be.equal(squad)

    it 'should create a list of 10 line players', ->
      expect(squad.linePlayers.length).to.be.equal(10)

  describe '#getPlayer', ->

    it 'should return an player', ->
      squad.getPlayer()
      expect(system.randElement.calledWith(squad.linePlayers)).to.be.true

  describe '#getKeeper', ->

    it 'should return first player of squad', ->
      expect(squad.getKeeper().player.name).to.be.equal('P1')
