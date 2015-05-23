expect = require('chai').expect

{ Action } = require('../index')

describe 'Action', ->

  attacker = { attack: 10 }
  blocker = { defense: 5 }
  bestBlocker = { defense: 15 }

  describe '#perform', ->

    describe 'when attacker is better', ->
      action = new Action(attacker, blocker)

      describe 'in equality conditions', ->
        result = action.perform()

        it 'should be success', -> expect(result.success).to.be.true

      describe 'in better conditions', ->
        result = action.perform()

        it 'should be success', -> expect(result.success).to.be.true

      describe 'in worser conditions', ->
        result = action.perform()

        it 'should not be success'#, -> expect(result.success).to.be.false

    describe 'when blocker is better', ->
      action = new Action(attacker, bestBlocker)

      describe 'in equality conditions', ->
        result = action.perform()

        it 'should not be success', -> expect(result.success).to.be.false
