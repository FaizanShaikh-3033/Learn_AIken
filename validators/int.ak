use aiken/math
use aiken/primitive/int

fn max1(x: Int, y: Int) -> Int {
  math.max(x, y)
}

test max_test() {
  max1(10, 11) == 11
}

fn min1(x: Int, y: Int) -> Int {
  math.min(x, y)
}

test min_test() {
  min1(2, 3) == 2
}

fn compare(x:Int, y:Int) {
    int.compare(x,y)
}

test compare_test(){
    compare(2,3) == Less
}