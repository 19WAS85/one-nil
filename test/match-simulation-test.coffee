expect = require('chai').expect
Helpers = require('./helpers/match-test-helpers')

{ GameSystem, Squad, BasicMove, Finishing, Match } = require('../index')

describe 'Match Simulation', ->

  TOTAL_MATCHES = 1000
  goals = 0

  [0...TOTAL_MATCHES].forEach ->
    system = new GameSystem()
    home = new Squad(system, Helpers.createPlayers('H', 10))
    away = new Squad(system, Helpers.createPlayers('A', 10))
    moves = [new BasicMove(), new Finishing()]
    match = new Match(system, home, away, moves)
    match.next() until match.status.isGameOver
    goals += match.status.score.home + match.status.score.away

  average = goals / TOTAL_MATCHES

  it 'goals average should be between 2.5 and 2.7', ->
    expect(average).to.be.within(2.5, 2.7)
