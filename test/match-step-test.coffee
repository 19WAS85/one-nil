expect = require('chai').expect

{ MatchStep, GameSystem } = require('../index')

describe 'MatchStep', ->
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
      step = new MatchStep(system)

      it 'should be success when attacker is better', ->
        result = step.perform(attacker, blocker)
        expect(result.success).to.be.true

      it 'should be success when blocker is better', ->
        result = step.perform(attacker, bestBlocker)
        expect(result.success).to.be.true

      it 'should not be success when blocker is the best and attacker worst', ->
        result = step.perform(worstAttacker, bestBlocker)
        expect(result.success).to.be.false

    describe 'in worst conditions', ->
      system = new GameSystem()
      system.rand = -> 1
      step = new MatchStep(system)

      it 'should not be success when attacker is better', ->
        result = step.perform(attacker, blocker)
        expect(result.success).to.be.false

      it 'should not be success when blocker is better', ->
        result = step.perform(attacker, bestBlocker)
        expect(result.success).to.be.false

      it 'should be success when blocker is worst and attacker best', ->
        result = step.perform(bestAttacker, worstBlocker)
        expect(result.success).to.be.true
