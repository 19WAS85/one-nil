expect = require('chai').expect

{ Finishing } = require('../index')

describe 'Finishing', ->
  move = new Finishing()

  describe '#isValid', ->

    it 'should be true when field is equals or greater than 20', ->
      expect(move.isValid(field: 20)).to.be.true
      expect(move.isValid(field: 23)).to.be.true

    it 'should be false when field is lower than 20', ->
      expect(move.isValid(field: 19)).to.be.false
      expect(move.isValid(field: 15)).to.be.false

  describe '#perform', ->

    describe 'when home attackers success', ->

      it 'should increase score value to home'

    describe 'when away attackers success', ->

      it 'should increase score value to away'

    describe 'when blocker success', ->

      it 'should not increase score value'
