expect = require('chai').expect

{ League } = require('../index')

describe 'League', ->
  teams = ['A', 'B', 'C', 'D', 'E']
  league = null

  describe 'constructor', ->

    beforeEach -> league = new League(teams)

    it 'should provide a list of rounds', ->
      expect(league.rounds.length).to.be.equal(10)

    it 'should provide rounds with events', ->
      expect(league.rounds[0].length).to.be.equal(2)

    it 'should provide matches in each round', ->
      expect(league.rounds[0][0].home).to.be.equal('A')
      expect(league.rounds[0][0].away).to.be.equal('B')
      expect(league.rounds[5][0].home).to.be.equal('B')
      expect(league.rounds[5][0].away).to.be.equal('A')
      expect(league.rounds[9][1].home).to.be.equal('C')
      expect(league.rounds[9][1].away).to.be.equal('D')

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

    it 'should provide the next round events'
