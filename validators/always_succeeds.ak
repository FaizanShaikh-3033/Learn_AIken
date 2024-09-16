// the underscore(_) before the name is for not getting the warning,beacsue of that we don't get warning
//example _datum
validator alwaysSucceeds {
  spend(
    _datum: Option<Data>,
    _redeemer: Data,
    _output_reference: Data,
    _context: Data,
  ) {
    True
  }

  else(_) {
    fail
  }
}

test tes_always_successful() {
  alwaysSucceeds.spend(None, 0, 0, 0) == True
}
