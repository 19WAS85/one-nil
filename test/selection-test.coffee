expect = require('chai').expect

{ Selection } = require('../index')

describe 'Selection', ->
  selection = null
  players = [0...16].map (i) -> name: "P#{i}", att: 5 + i, def: 20 - i

  beforeEach ->
    system = { rand: -> 5 }
    selection = new Selection(system, players)

  describe '#createSquad', ->
    squad = null

    beforeEach -> squad = selection.createSquad()

    it 'should return a squad with 11 players', ->
      expect(squad.players.length).to.be.equal(11)

    it 'should return a squad with game system', ->
      expect(squad.system.rand()).to.be.equal(5)

    it 'should return 5 best attackers', ->
      expect(squad.players[10].player.name).to.be.equal('P15')
      expect(squad.players[6].player.name).to.be.equal('P11')

    it 'should return 5 best blockers', ->
      expect(squad.players[0].player.name).to.be.equal('P5')
      expect(squad.players[5].player.name).to.be.equal('P0')

    it 'should return the best keeper in 1st position'
    it 'should avoid duplicated players'
