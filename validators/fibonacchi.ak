fn fibonaachi(x:Int) -> Int {
    if x == 0 || x == 1{
        1
    }else {
        fibonaachi (x-1) + fibonaachi(x-2)
    } 
}

test fibonaachi_test () {
    fibonaachi(3) == 4
}