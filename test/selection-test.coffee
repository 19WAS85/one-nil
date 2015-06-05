expect = require('chai').expect

{ Selection } = require('../index')

describe 'Selection', ->
  selection = null
  players = [0...16].map (i) -> name: "P#{i}", att: 10 + i, def: 20 - i

  beforeEach ->
    system = { }
    selection = new Selection(system, players)

  describe '#createSquad', ->
    squad = null

    beforeEach -> squad = selection.createSquad()

    it 'should return a squad with 11 players', ->
      expect(squad.players.length).to.be.equal(11)

    it 'should return a squad eith game system'
    it 'should return 5 best attackers'
    it 'should return 5 best blockers'
    it 'should return the best keeper in 1st position'
    it 'should not affect original players array'
