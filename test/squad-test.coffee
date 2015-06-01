expect = require('chai').expect
Helpers = require('./helpers/player-helpers')

{ Squad, GameSystem } = require('../index')

describe 'Squad', ->
  players = Helpers.createPlayers('P', 10)
  squad = new Squad(new GameSystem(), players)

  describe '#players', ->

    it 'should have a list of players', ->
      expect(squad.players.length).to.be.equal(11)

    it 'each player should references squad', ->
      expect(squad.players[0].squad).to.be.equal(squad)
      expect(squad.players[10].squad).to.be.equal(squad)

  describe '#getPlayer', ->

    it 'should return an attacker player', ->
      expect(squad.getPlayer().player.name).to.contain('P')
