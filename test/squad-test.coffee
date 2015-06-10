expect = require('chai').expect
sinon = require('sinon')

{ Squad } = require('../index')

createEmptyStatus = ->
  points: 0, wins: 0, draws: 0, loses: 0, goals: 0, goalsAgainst: 0, diff: 0

describe 'Squad', ->
  system = null
  team = null
  squad = null

  beforeEach ->
    stats = createEmptyStatus()
    team = stats: stats, team: players: []
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

  describe '#updateStats', ->

    it 'should update league stats when self wins', ->
      squad.updateStats(4, 2)
      expect(team.stats.points).to.be.equal(3)
      expect(team.stats.wins).to.be.equal(1)
      expect(team.stats.draws).to.be.equal(0)
      expect(team.stats.loses).to.be.equal(0)
      expect(team.stats.goals).to.be.equal(4)
      expect(team.stats.goalsAgainst).to.be.equal(2)
      expect(team.stats.diff).to.be.equal(2)

    it 'should update league stats when other wins', ->
      squad.updateStats(2, 4)
      expect(team.stats.points).to.be.equal(0)
      expect(team.stats.wins).to.be.equal(0)
      expect(team.stats.draws).to.be.equal(0)
      expect(team.stats.loses).to.be.equal(1)
      expect(team.stats.goals).to.be.equal(2)
      expect(team.stats.goalsAgainst).to.be.equal(4)
      expect(team.stats.diff).to.be.equal(-2)

    it 'should update league stats when draws', ->
      squad.updateStats(3, 3)
      expect(team.stats.points).to.be.equal(1)
      expect(team.stats.wins).to.be.equal(0)
      expect(team.stats.draws).to.be.equal(1)
      expect(team.stats.loses).to.be.equal(0)
      expect(team.stats.goals).to.be.equal(3)
      expect(team.stats.goalsAgainst).to.be.equal(3)
      expect(team.stats.diff).to.be.equal(0)
