//: Playground - noun: a place where people can play

import Foundation

func sum(a: Int, b: Int) -> Int {
    return a + b
}

func divide(a: Int, b: Int) -> Int {
    return a / b
}

func multiply(a: Int, b: Int) -> Int {
    return a * b
}

func subtract(a: Int, b: Int) -> Int {
    return a - b
}

func getOperation(named operation: String) -> (Int, Int) -> Int {
    switch operation {
    case "sum":
        return sum
    case "subtract":
        return subtract
    case "divide":
        return divide
    case "multiply":
        return multiply
    default:
        return divide
    }
}

var operation = getOperation(named: "sum")
operation(10, 15)

//Usando funções como parâmetro de funções
typealias Operation = (Int, Int) -> Int

func applyOperation(a: Int, b: Int, operation: Operation) -> Int {
    return operation(a, b);
}

let result = applyOperation(a: 10, b: 50, operation: sum)
print(result)


// Clojure
let result2 = applyOperation(a: 20, b: 3, operation: {(x: Int, y: Int) -> Int in
    return x % y
})
print(result2)

let result3 = applyOperation(a: 20, b: 3){$0 % $1}
print(result3)
