// - Activity 001 - Create the substraction (-) function and test it 

fn sub (x:Int , y:Int) -> Int{
    x-y
}

test sub_test(){
    sub(5,2) ==3
}

fn sum(x,y) -> Int {
    x+y
}


//- Activity 002 - Create the multiplication (*) function and test it 

fn mul(x:Int, y :Int) -> Int{
    x*y
}

test mul_test(){
    mul(5,2) == 10
}

// - Activity 003 - Create the division (/) function and test it


fn divd(x,y) {
    x/y
}

test divd_test(){
    divd(10,5) == 2
}

//- Activity 004 - Modify the main function that uses the sum function and the new functions created in the previous practices and test it

fn main() {
    let result = sum (2,3)
    let result = sub(result,1)
    let result = mul(result,2)
    let result = divd (result,2)
    result
}

test main_test(){
    main()==4
}