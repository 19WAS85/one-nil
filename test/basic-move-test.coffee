expect = require('chai').expect

{ BasicMove } = require('../index')

describe 'BasicMove', ->
  move = new BasicMove()

  describe '#isValid', ->

    it 'should be valid when field < 20', ->
      expect(move.isValid(field: 1)).to.be.true
      expect(move.isValid(field: 19)).to.be.true

    it 'should not be valid when field >= 20', ->
      expect(move.isValid(field: 20)).to.be.false
      expect(move.isValid(field: 25)).to.be.false

  describe '#perform', ->

    describe 'when attacker succeed', ->

      it 'should move field'

    describe 'when blocker succeed', ->

      it 'should reset field'
      it 'should swap players'
