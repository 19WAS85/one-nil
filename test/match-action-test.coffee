expect = require('chai').expect

{ MatchAction, GameSystem } = require('../index')

describe 'MatchAction', ->
  attacker = { att: 10 }
  blocker = { def: 5 }
  bestBlocker = { def: 20 }

  describe '#perform', ->

    describe 'in perfect conditions', ->
      system = new GameSystem()
      system.rand = -> 20
      action = new MatchAction(system)

      it 'should be success when attacker is better', ->
        result = action.perform(attacker, blocker)
        expect(result.success).to.be.true

      it 'should be success when blocker is better', ->
        result = action.perform(attacker, bestBlocker)
        expect(result.success).to.be.true

      it 'should not be success when blocker is the best and attacker worst'

    describe 'in worst conditions', ->

      it 'should not be success when attacker is better'
      it 'should not be success when blocker is better'
      it 'should be success when blocker is worst and attacker best'
