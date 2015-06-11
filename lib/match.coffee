{ Status } = require('../index')

class Match

  constructor: (@system, @home, @away, @moves) ->
    @status = new Status(this)

  getNextMove: -> @moves.filter((m) => m.isValid(@status))[0]

  next: ->
    @getNextMove().perform(@status)
    @status.next()
    if @status.isOver
      @home.updateStats(@status.score.home, @status.score.away)
      @away.updateStats(@status.score.away, @status.score.home)

  simulate: -> @next() until @status.isOver

module.exports = Match
