use aiken/collection/list

// adding elem in list
fn add_element(list: List<Int>, elem: Int) -> List<Int> {
  list.push(list, elem)
}

test add_element_to_list() {
  let initial_list =
    [2, 3]
  let result = add_element(initial_list, 1)
  let expected =
    [1, ..[2, 3]]

  expect result == expected
}

// concat 2 list
fn concat_lst(x: List<Int>, y: List<Int>) {
  list.concat(x, y)
}

test concat_lst_test() {
  let left_lst =
    [1, 2, 3]
  let right_lst =
    [4, 5, 6]

  let result = concat_lst(left_lst, right_lst)
  expect [1, 2, 3, 4, 5, 6] == result
}

fn str(x) {
  x
}

test str_test() {
  when str("f") is {
    "" -> False
    x -> True
  }
}
