fn fibonaachi(x:Int) -> Int {
    if x == 0 || x == 1{
        1
    }else {
        fibonaachi (x-1) + fibonaachi(x-2)
    } 
}

test fibonaachi_test () {
    fibonaachi(4) == 3
}

fn fibo_when(x)-> Int{
    when x is {
        0 || 1 -> 1
        _ -> fibo_when(x-1) + fibo_when(x-2)
    }
}

test fibo_when_test(){
    fibo_when(1) == 1
}