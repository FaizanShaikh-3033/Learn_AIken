// Functions are private by default. They can be exported with the 'pub' keyword.
pub fn add(x: Int, y: Int) -> Int {
  x + y
}

// using |> , used to pass output of 1 fucntion as input to another funtion

fn double(x: Int) -> Int {
  x * 2
}

// code explanation
// Initially, x = 10.
// x |> f is double(10) → 20.
// 20 |> f is double(20) → 40.
// here f:fn(x)->x is double function we are passing 
fn add_twice(x, f: fn(x) -> x) {
  x
    |> f
    |> f
}

test add_twice_test() {
  add_twice(10, double) == 40
}

// code explanation
// Initially, x = 2.
// x |> f is double(4) → 4.
// 4 |> f is double(16) → 16.
// here f:fn(x)->x is mul function we are passing 
fn multiply(x, f: fn(x) -> x) {
  x
    |> f
    |> f
}

fn mul(x: Int) -> Int {
  x * x
}

test multiply_test() {
  multiply(2, mul) == 16
}

//intermidate question on |>

fn add1(x: Int) -> Int {
  x + 1
}

fn sub(x: Int) -> Int {
  x - 1
}

fn perform_operation(x: Int, f: fn(Int) -> Int) -> Int {
  x
    |> add1 // Add 1
    |> mul // Multiply by 2
    |> sub // Subtract 3
    |> double
  // Double the result
}

test perform_opeartion_test() {
  let x = 2
  let result = perform_operation(2, add1)
  result == 16
}

fn add2(x: Int) -> Int {
  x + 2
}

fn square(x: Int) -> Int {
  x * x
}

fn practice(x: Int, f: fn(Int) -> Int) -> Int {
  x
    |> add2
    |> square
}

test practice_test() {
  practice(2, add2) == 16
}

//--------------------------------------------------
validator always_succeeds {
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

// ---------------------------------------------------------
// PATTERN Matching
// fn describe_list(list) -> String{
//     when list is {
//         [] -> @"The list is empty"
//         [x] -> @"The list is having 1 element"
//         [x,y,..] -> @"The list has multiple elements"
//     }
// }

fn greater(x: Int) -> Int {
  if x < 0 {
    x
  } else {
    x + 10
  }
}

test greater_test() {
  greater(2) == 12
}
