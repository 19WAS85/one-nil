expect = require('chai').expect
log = require('../helpers/functional-log')('Match')

{ GameSystem, Selection, BasicMove, Finishing, Match } = require('../../index')

describe 'Match Functional', ->

  TOTAL_MATCHES = 1000
  goals = 0

  createPlayers = (prefix, attr) ->
    [0...15].map (i) -> name: prefix + i, att: attr, def: attr, gk: attr

  [0...TOTAL_MATCHES].forEach ->
    system = new GameSystem()
    homeTeam = team: players: createPlayers('H', 10)
    awayTeam = team: players: createPlayers('A', 10)
    home = new Selection(system, homeTeam).createSquad()
    away = new Selection(system, awayTeam).createSquad()
    moves = [new BasicMove(), new Finishing()]
    match = new Match(system, home, away, moves)
    match.simulate()
    goals += match.status.score.home + match.status.score.away

  average = goals / TOTAL_MATCHES

  log.info("average-goals=#{average}")

  it 'goals average should be between 2.5 and 2.7', ->
    expect(average).to.be.within(2.45, 2.75)
