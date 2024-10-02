fn is_prime_recursive(n: Int, i: Int) -> Int {
    if i * i > n {
        1
    } else if n % i == 0 {
        0
    } else {
        is_prime_recursive(n, i + 1)
    }
}

fn is_prime(n: Int) -> Int {
    if n <= 2 {
        0
    } else {
        is_prime_recursive(n, 2)
}
}

test is_prime_test() {
    is_prime(9) == 0
  
}
