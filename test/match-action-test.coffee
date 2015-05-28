expect = require('chai').expect

{ MatchAction, GameSystem } = require('../index')

describe 'MatchAction', ->
  attacker = { att: 10 }
  bestAttacker = { att: 20 }
  worstAttacker = { att: 1 }
  blocker = { def: 5 }
  bestBlocker = { def: 20 }
  worstBlocker = { def: 1 }

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

      it 'should not be success when blocker is the best and attacker worst', ->
        result = action.perform(worstAttacker, bestBlocker)
        expect(result.success).to.be.false

    describe 'in worst conditions', ->
      system = new GameSystem()
      system.rand = -> 1
      action = new MatchAction(system)

      it 'should not be success when attacker is better', ->
        result = action.perform(attacker, blocker)
        expect(result.success).to.be.false

      it 'should not be success when blocker is better', ->
        result = action.perform(attacker, bestBlocker)
        expect(result.success).to.be.false

      it 'should be success when blocker is worst and attacker best', ->
        result = action.perform(bestAttacker, worstBlocker)
        expect(result.success).to.be.true
