class Finishing

  @FIELD_NEEDED = 20

  isValid: (status) ->
    status.field >= Finishing.FIELD_NEEDED

module.exports = Finishing
