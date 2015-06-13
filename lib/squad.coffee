class Squad

  @WIN = 3
  @DRAW = 1

  constructor: (@system, @team, players) ->
    @players = players.map (p) => player: p, squad: this
    @linePlayers = @players.slice(1, 11)

  getPlayer: -> @system.randElement(@linePlayers)

  getKeeper: -> @players[0]

  updateStats: (selfScore, otherScore) ->
    return unless @team.stats
    @team.stats.goals += selfScore
    @team.stats.goalsAgainst += otherScore
    @team.stats.diff += selfScore - otherScore
    if selfScore > otherScore
      @team.stats.wins++
      @team.stats.points += Squad.WIN
    else if selfScore is otherScore
      @team.stats.draws++
      @team.stats.points += Squad.DRAW
    else @team.stats.loses++

module.exports = Squad
