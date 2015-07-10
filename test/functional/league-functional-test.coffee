expect = require('chai').expect
log = require('../helpers/functional-log')('League')
teams = require('../helpers/teams.json')

{
  GameSystem,
  League,
  BasicMove,
  Finishing,
  Selection,
  Match
} = require('../../index')

statsOf = (league, func) ->
  league.teams.map((t) -> t.stats).forEach (s) -> func(s)

describe 'League Functional', ->
  system = new GameSystem()
  moves = [new BasicMove(), new Finishing()]
  league = new League(teams)
  until league.isOver
    round = league.next()
    log.info()
    log.info("Round #{league.roundIndex + 1}")
    round.forEach (event) ->
      home = new Selection(system, event.home).createSquad()
      away = new Selection(system, event.away).createSquad()
      match = new Match(system, home, away, moves)
      match.simulate()
      log.info(
        "#{match.home.team.team.name} #{match.context.score.home} x " +
        "#{match.context.score.away} #{match.away.team.team.name}")
  log.info()
  league.standings().forEach (t, i) ->
    log.info("#{(i + 1)} #{t.team.name} #{t.stats.points}")

  it 'should provide team points', ->
    statsOf league, (stats) ->
      expect(stats.points).to.be.equal(stats.wins * 3 + stats.draws)

  it 'should provide team goals', ->
    statsOf league, (stats) ->
      expect(stats.diff).to.be.equal(stats.goals - stats.goalsAgainst)

  it 'should provide team matches count', ->
    statsOf league, (stats) ->
      expect(stats.wins + stats.draws + stats.loses).to.be.equal(38)
