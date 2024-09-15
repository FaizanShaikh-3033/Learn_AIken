fn sum (x,y)->Int{
    x+y
}

fn expicit(x:Int, y:Int)-> Int {
    let z = sum(x, y)
    z+x+y 
}

test expicit_test(){
    expicit(2,3) == 10
}

fn sub (x, y) -> Int {
    x-y
}

fn explicit_sub (x,y){
    let v = sub(x,y)
    v-x-y
}

test explicit_sub_test (){
    explicit_sub(7,1) == -2
}

fn derivate (x,y)-> Int{
    x%y
}

test derivate_test(){
    derivate(10,5) == 0
}