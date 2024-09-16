fn main() {
  let x = 5
  let y = 6
  let z = x + y
  x + y + z
}

fn sum(x, y) -> Int {
  x + y
}

fn sub(a: Int, b: Int) -> Int {
  a - b
}

test main_test() {
  main() == 22
}

test sum_test() {
  sum(10, 11) == 21
}

//we are failing this by not putting the expected value , (5-3=2, we put 21, so it failing)
test sub_test() {
  sub(5, 3) == 2
}
