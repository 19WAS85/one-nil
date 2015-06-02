class Helpers

  @createPlayers: (namePrefix, quality) ->
    [0...11].map (i) -> name: namePrefix + i, att: quality, def: quality

module.exports = Helpers
