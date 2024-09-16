
fn factorail_1(x: Int) -> Int {
  when x is {
    0 || 1-> 1
    _ -> x * factorail_1(x - 1)
  }
}

test factorial_test() {
  let result = factorail_1(3)
  if result != 6 {
    fail
  } else {
    True
  }
}

test factorial_test1() {
    let result = factorail_1(3)
    expect result == 6 
}


