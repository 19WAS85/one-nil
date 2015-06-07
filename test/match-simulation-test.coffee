console.log(new Date())

expect = require('chai').expect

{ GameSystem, Selection, BasicMove, Finishing, Match } = require('../index')

describe 'Match Simulation', ->

  TOTAL_MATCHES = 1000
  goals = 0

  createPlayers = (prefix, attr) ->
    [0...15].map (i) -> name: prefix + i, att: attr, def: attr, kp: attr

  [0...TOTAL_MATCHES].forEach ->
    system = new GameSystem()
    home = new Selection(system, createPlayers('H', 10)).createSquad()
    away = new Selection(system, createPlayers('A', 10)).createSquad()
    moves = [new BasicMove(), new Finishing()]
    match = new Match(system, home, away, moves)
    match.next() until match.status.isGameOver
    goals += match.status.score.home + match.status.score.away

  average = goals / TOTAL_MATCHES

  it 'goals average should be between 2.5 and 2.7', ->
    expect(average).to.be.within(2.5, 2.7)
