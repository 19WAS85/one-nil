expect = require('chai').expect

{ Selection } = require('../../index')

describe 'Selection', ->
  selection = null
  team = players: [0...15].map (i) -> name: "P#{i}", att: 6 + i, def: 20 - i
  team.players.push(
    { name: 'PX', att: 20, def: 20 }
    { name: 'K1', gk: 20 },
    { name: 'K12', gk: 10 }
  )

  beforeEach ->
    system = { rand: -> 5 }
    selection = new Selection(system, team: team)

  describe '#createSquad', ->
    squad = null

    beforeEach -> squad = selection.createSquad()

    it 'should return a squad with 11 players', ->
      expect(squad.players.length).to.be.equal(11)

    it 'should return a squad with game system', ->
      expect(squad.system.rand()).to.be.equal(5)

    it 'should return 5 best attackers', ->
      expect(squad.players[10].player.name).to.be.equal('PX')
      expect(squad.players[6].player.name).to.be.equal('P11')

    it 'should return 5 best blockers', ->
      expect(squad.players[1].player.name).to.be.equal('P0')
      expect(squad.players[5].player.name).to.be.equal('P4')

    it 'should return the best keeper in 1st position', ->
      expect(squad.players[0].player.name).to.be.equal('K1')

    it 'should avoid duplicated players', ->
      px = squad.players.filter (p) -> p.player.name is 'PX'
      expect(px.length).to.be.equal(1)
