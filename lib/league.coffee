class League

  constructor: (@teams) -> @rounds = @schedule(@teams)

  schedule: (teams) ->
    size = teams.length - 1 + teams.length % 2
    rounds = [0...size].map -> []
    flag = [0...teams.length].map -> []
    home = true
    [0...teams.length].forEach (i) ->
      r = (2 * i) % size
      [(i + 1)...teams.length].forEach (j) ->
        r = (r + 1) % size while r in flag[i]
        rounds[r].push
          home: teams[if home then i else j]
          away: teams[if home then j else i]
        flag[j].push(flag[i].push(r))
        home = !home
    rounds.forEach (r) -> rounds.push(r.map (e) -> home: e.away, away: e.home)
    rounds

module.exports = League
