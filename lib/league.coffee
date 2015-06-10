class League

  constructor: (teams) ->
    @teams = teams.map (t) => team: t, stats: @emptyStats()
    @schedule(teams)

  schedule: (teams) ->
    @rounds = [0...teams.length - 1 + teams.length % 2].map -> []
    schedule = [0...teams.length].map -> []
    home = true
    teams.forEach (team, i) =>
      round = (2 * i) % @rounds.length
      [(i + 1)...teams.length].forEach (j) =>
        round = (round + 1) % @rounds.length while round in schedule[i]
        @rounds[round].push
          home: teams[if home then i else j]
          away: teams[if home then j else i]
        schedule[j].push(round)
        schedule[i].push(round)
        home = !home
    @rounds.forEach (r) =>
      @rounds.push(r.map (e) -> home: e.away, away: e.home)
    @size = @rounds.length * @rounds[0].length

  emptyStats: ->
    points: 0, wins: 0, draws: 0, loses: 0, goals: 0, goalsAgainst: 0, diff: 0

module.exports = League
