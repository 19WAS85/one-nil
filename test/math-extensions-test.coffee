expect = require('chai').expect

{ MathExtensions } = require('../index')

describe 'MathExtensions', ->
  mathExtensions = new MathExtensions(Math);
  mathExtensions.perform()

  describe '#rand', ->

    it 'should provide a random number between an interval', ->
      for i in [0..1000]
        do ->
          expect(Math.rand(5, 21)).to.be.above(4)
          expect(Math.rand(5, 21)).to.be.below(22)
