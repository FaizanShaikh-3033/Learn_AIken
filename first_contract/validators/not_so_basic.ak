use aiken/collection/list
use aiken/option
use aiken/primitive/int
use aiken/primitive/bytearray

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

fn max_num_when(list: List<Int>, max: Int) -> Int {
  let i =
    when list.head(list) is {
      Some(a) -> a
      None -> 0
    }
  if list == [] {
    0
  } else if i >= max {
    let max = i
    max_num(list.drop(list, 1), max)
  } else {
    max
  }
}

test max_wehn_test() {
  max_num_when([2, 4, 6, 7, 8, 9, 3, 2], 0) == 9
}


test max_test() {
  max_num([2, 4, 6, 7, 8, 9, 3, 2], 0) == 9
}

test maxn_test() {
  max_num_n([2, 4, 6, 7, 8, 9, 3, 2]) == Some(9)
}


type Person{
  name:ByteArray,
  age:Int,
  ismale:Bool
}

type Person2 {
  Personinfo{
  name:ByteArray,
  age:Int,
  ismale:Bool
}
  Address{
    street:ByteArray,
    country:ByteArray,
    nationality:ByteArray
  }
}


fn person1(person:Person)->ByteArray{
  person.name
}

test person_test(){ 
  person1(Person("Alive",21, True)) == "Alive"
}

fn whole_person(person:Person)-> Person{
  Person(person.name,person.age,person.ismale)
}

test whole_person_test(){
  whole_person(Person("Alice",20,False)) == Person("Alice",20,False)
}


type The_datum{
  datum:Option<Int>
}

fn check_datum(dat:The_datum)->Bool{
  when dat.datum is {
    None -> False
    Some(x) -> x>10
  }
}

test check_datum_test(){
  check_datum(The_datum{datum:Some(15)}) == True
}
// fn palindrome(input: ByteArray) -> Bool {
//   let len = bytearray.length(input)
//   if bytearray.length(input) <= 1 {
//     True
//   } else if bytearray.at(input, 0) == bytearray.at(input, len - 1) {
//     palindrome(bytearray.slice(input, start: 1, end: len - 2))
//   } else {
//     False
//   }
// }

// test palindrome_test() {
//   palindrome("rahar") == True && palindrome("rahat") == False
// }

// fn count_vowels(x){
//   let vowel = ["a","e","i","o","u"]
//   if list.has(x,vowel){
//   True}
//   else{
//     False
//   }
// }

// test count_vowels_test(){
//   count_vowels([["faizan"]]) == True
// }

// fn count_vowels1(x:ByteArray){
//   let i =2
//   let vovel = ["a","e","i","o","u"]
//   let found = bytearray.take(x,i) 
//   if list.has(vovel,found){
//     True
//   }else{
//     False
//   }
// }

// test count_vowels1_test(){
//   count_vowels1("Faizan") == True
// }
// //else if bytearray.at(input, 0) == bytearray.at(input, len - 1) {
// //     palindrome(bytearray.slice(input, start: 1, end: len - 2))
// fn count_vowels2(x){
//   let vovel = "aeiou"
//   let len = bytearray.length(x)
//   if bytearray.at(x,1) == bytearray.at(vovel,0){
//     True
//   }else{
//     False
//   }
// }

// test count_vowels2_test(){
//   count_vowels2("faizan")== True
//  }

const vowels = "aeiouAEIOU"

fn count_vowels3(x: ByteArray) -> Int {
  bytearray.foldl(x, 0, fn (byte, acc) {
    if bytearray.index_of(vowels, bytearray.from_int_big_endian(byte, 1)) != None {
      acc + 1
    } else {
      acc
    }
  })
}

test count_vowels_test3() {
  count_vowels3("faizan") == 3
}

fn count_vowel(string: ByteArray, n: Int) -> Int {
  let vowel_list = "aeiouAEIOU"
  when bytearray.is_empty(string) is {
    True -> n
    False ->
      if bytearray.index_of(vowel_list, bytearray.take(string, 1)) == None {
        count_vowel(bytearray.drop(string, 1), n)
      } else {
        count_vowel(bytearray.drop(string, 1), n + 1)
      }
  }
}

fn count_v(string: ByteArray) -> Int {
  count_vowel(string, 0)
}

test count_vowel_check() {
  count_v("faizan") == 3
}