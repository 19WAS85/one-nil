{ MatchContext } = require('../index')

class Match

  constructor: (@system, @home, @away, @moves) ->
    @context = new MatchContext(this)

  getNextMove: -> @moves.filter((m) => m.isValid(@context))[0]

  next: ->
    @getNextMove().perform(@context)
    @context.next()
    if @context.isOver
      @home.updateStats(@context.score.home, @context.score.away)
      @away.updateStats(@context.score.away, @context.score.home)

  simulate: -> @next() until @context.isOver

module.exports = Match
