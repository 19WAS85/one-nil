expect = require('chai').expect

{ League } = require('../../index')

describe 'League', ->
  teams = ['A', 'B', 'C', 'D', 'E']
  league = null

  beforeEach -> league = new League(teams)

  describe 'constructor', ->

    it 'should provide a list of rounds', ->
      expect(league.rounds.length).to.be.equal(10)

    it 'should provide rounds with events', ->
      expect(league.rounds[0].length).to.be.equal(2)

    it 'should provide matches in each round', ->
      expect(league.rounds[0][0].home.team).to.be.equal('A')
      expect(league.rounds[0][0].away.team).to.be.equal('B')
      expect(league.rounds[5][0].home.team).to.be.equal('B')
      expect(league.rounds[5][0].away.team).to.be.equal('A')
      expect(league.rounds[9][1].home.team).to.be.equal('C')
      expect(league.rounds[9][1].away.team).to.be.equal('D')

    it 'should provide the matches size', ->
      expect(league.size).to.be.equal(20)

    describe 'team stats', ->

    it 'should create league stats to each team', ->
      expect(league.teams[0].team).to.be.equal('A')

    it 'should provide points', ->
      expect(league.teams[0].stats.points).to.be.equal(0)

    it 'should provide wins', ->
      expect(league.teams[0].stats.wins).to.be.equal(0)

    it 'should provide draws', ->
      expect(league.teams[0].stats.draws).to.be.equal(0)

    it 'should provide loses', ->
      expect(league.teams[0].stats.loses).to.be.equal(0)

    it 'should provide goals', ->
      expect(league.teams[0].stats.goals).to.be.equal(0)

    it 'should provide goals against', ->
      expect(league.teams[0].stats.goalsAgainst).to.be.equal(0)

    it 'should provide goals diff', ->
      expect(league.teams[0].stats.diff).to.be.equal(0)

  describe '#next', ->
    round = null

    it 'should provide the next round events', ->
      round = league.next()
      expect(round[0].home.team).to.be.equal('A')
      expect(round[0].away.team).to.be.equal('B')

    it 'should set league end when all rounds were provided', ->
      expect(league.isOver).to.be.false
      league.next() until league.isOver

    it 'should provide actual round', ->
      expect(league.roundIndex).to.be.equal(-1)
      round = league.next()
      expect(league.roundIndex).to.be.equal(0)

  describe '#standings', ->
    standings = null

    beforeEach ->
      league.teams[0].stats.points = 2
      league.teams[1].stats.points = 3
      league.teams[2].stats.points = 0
      league.teams[3].stats.points = 4
      league.teams[4].stats.points = 1
      standings = league.standings()

    it 'should provide stats sorted by points', ->
      expect(standings[0].team).to.be.equal('D')
      expect(standings[1].team).to.be.equal('B')
      expect(standings[4].team).to.be.equal('C')
