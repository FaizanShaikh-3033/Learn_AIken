use aiken/collection/list
use aiken/option
use aiken/primitive/int

type FixedP =
  Pair<Int, Int>

fn fixed_point_division(valorI: Int, interesI: Int, precision: Int) -> FixedP {
  let valorFix = valorI * precision_multiplier(precision)
  let interesFix = interesI * precision_multiplier(precision)

  Pair(
    valorFix / interesFix,
    valorI % interesI * precision_multiplier(precision) / interesI,
  )
}

fn precision_multiplier(precision: Int) -> Int {
  when precision is {
    0 -> 1
    1 -> 10
    2 -> 100
    3 -> 1000
    4 -> 10000
    5 -> 100000
    6 -> 1000000
    _ -> fail
  }
}

// FP presentation must be done off-chain
test fixed_point_example_test() {
  let fp = fixed_point_division(100, 2000, 6)
  let Pair(n, d) = fp
  n * 1000000 + d == 50000
}
//


type A {
  value: Int
}

type B {
  Alpha(Int)
  Beta(Int)
}

fn soft_cast(data: Data) -> Int {
  if data is A {
    data.value
  } else if data is Alpha(x): B {
    x + 10
  } else if data is Beta(y): B {
    y + 20
  } else {
    0  // fallback case
  }
}

test test_soft_cast(){
  // Test case 1: Data is of type A
  let dataA = A( 5 )
  soft_cast(dataA) == 5
}

test test_soft_cast_2(){
  let dataAlpha = Alpha(5)
  soft_cast(dataAlpha) == 5
}

test test_soft_cast_3(){
  let dataBeta = Beta(15)
  soft_cast(dataBeta) == 35
}


type X {
  Value(Int)
  Name(String)
}

fn checkX (data:Data){
  if data is Value(x):X {
    x+10
  }
  else if data is Name(x):X{
    1
  }
  else{
    0
  }
}

test checkX_test(){
  let dataValue = Value(5)
  checkX(dataValue) == 15
}

test checkX_test_1(){
  let dataName = Name(@"Fai")
  checkX(dataName) == 1
}


// fn sorted1(x, f: fn(x) -> x) {
//   x
//     |> sort
//     |> tail
// }
fn max_num(list: List<Int>, max: Int) -> Int {
  let i = option.or_else(list.head(list), 0)
  if list == [] {
    max
  } else if i >= max {
    let max = i
    max_num(list.drop(list, 1), max)
  } else {
    max
  }
}

fn max_num_n(list: List<Int>) -> Option<Int> {
  let len = list.length(list)
  list.at(list.sort(list, int.compare), len - 1)
}

test max_test() {
  max_num([2, 4, 6, 7, 8, 9, 3, 2], 0) == 9
}

test maxn_test() {
  max_num_n([2, 4, 6, 7, 8, 9, 3, 2]) == Some(9)
}