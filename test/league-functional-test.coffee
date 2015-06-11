expect = require('chai').expect
teams = require('./helpers/barclays-premier-league-teams')

{
  GameSystem,
  League,
  BasicMove,
  Finishing,
  Selection,
  Match
} = require('../index')

describe 'League Functional', ->
  system = new GameSystem()
  moves = [new BasicMove(), new Finishing()]
  league = new League(teams)
  until league.isOver
    round = league.next()
    # console.log()
    # console.log("Round #{league.roundIndex + 1}")
    round.forEach (event) ->
      home = new Selection(system, event.home).createSquad()
      away = new Selection(system, event.away).createSquad()
      match = new Match(system, home, away, moves)
      match.simulate()
      # console.log(
      #   "#{match.home.team.team.name} #{match.status.score.home} x " +
      #   "#{match.status.score.away} #{match.away.team.team.name}")

  it 'should provide league stats', ->
    stats = league.teams[0].stats
    expect(stats.points).to.be.equal(stats.wins * 3 + stats.draws)
    expect(stats.diff).to.be.equal(stats.goals - stats.goalsAgainst)
