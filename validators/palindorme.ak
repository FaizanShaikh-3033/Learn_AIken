use aiken/collection/list
use aiken/primitive/string
use aiken/primitive/bytearray
use aiken/primitive/string

fn string_pa(x)->Bool {
    if x == list.reverse(x){
        True
    }else{
        False
    }
}

test string_pa_test(){
    string_pa(["faizan"])
}


fn palindrom(x:List<Int>)-> Bool {
    let reverse =list.reverse(x)
    if   x == reverse {
        True
    }else{
        False
    }
    
}

test palindrom_test(){
    palindrom([1,2,3])
}


fn palindrome(input: ByteArray) -> Bool {
  let len = bytearray.length(input)
  if bytearray.length(input) <= 1 {
    True
  } else if bytearray.at(input, 0) == bytearray.at(input, len - 1) {
    palindrome(bytearray.slice(input, start: 1, end: len - 2))
  } else {
    False
  }
}

test palindrome_test() {
  palindrome("rahar") == True && palindrome("rahat") == False
}


fn reverse_str(x)-> Bool{
    let to_byte = string.to_bytearray(x)
    let len = bytearray.length(to_byte)
    if bytearray.length(to_byte) <= 1{
        True
    }
    else {
        bytearray.foldl(to_byte," ",flip(bytearray.push)) == " "
    }


//     if bytearray.length(to_byte) <= 1 {
//         True
//     } else if bytearray.at(to_byte, 0) == bytearray.at(to_byte, len - 1) {
//         palindrome(bytearray.slice(to_byte, start: 1, end: len - 2))
//     } else {
//         False
//   }
}

test reverse_str_test(){
    reverse_str(bytearray.to_string(("faizan"))) == True
}