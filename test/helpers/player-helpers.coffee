class Helpers

  @createPlayers: (name, quality) ->
    [0...11].map (i) -> name: name + i, att: quality, def: quality

module.exports = Helpers
