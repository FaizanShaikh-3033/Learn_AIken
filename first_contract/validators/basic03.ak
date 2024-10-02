fn even_odd_bool(x: Int) -> Bool {
  if x % 2 == 0 {
    True
  } else {
    False
  }
}

test even_odd_bool_test() {
  even_odd_bool(10) == True
}

fn even_odd_number(x: Int) -> Int {
  if x % 2 == 0 {
    1
  } else {
    0
  }
}

test even_odd_number_test() {
  even_odd_number(10) == 1
}

fn even_odd_when(x: Int) -> Bool {
  when x % 2 is {
    0 -> True
    _ -> False
  }
}

test even_odd_when_test() {
  even_odd_when(2)
}

fn even(x: Int) -> Bool {
  x % 2 == 0
}

fn odd(x: Int) -> Bool {
  !even(x)
}

test even_odd_test_optimise() {
  let number = 3

  if even(number) {
    True
  } else {
    odd(number)
  }
}

test even_odd_test() {
  let number = 3

  let is_even_or_odd = even(number) || odd(number)

  expect is_even_or_odd
}

// compares prices vs payment and answer True if payment >= price, 
//and False if not.

fn price(price: Int, payment: Int) -> Bool {
  payment >= price
}

test price_test_pass() {
  price(10, 12)
}

test price_test_fail() {
  price(100, 12)
}
