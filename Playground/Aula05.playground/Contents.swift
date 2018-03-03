//: Playground - noun: a place where people can play

import UIKit
import Foundation

// Enumeradores
enum Compass {
    case north
    case south
    case east
    case west
}

var heading: Compass = .north

switch heading {
case .north:
    print("Você está indo para o Norte.")
case .south:
    print("Você está indo para o Sul.")
case .east:
    print("Você está indo para o Leste.")
case .west:
    print("Você está indo para o Oeste.")
}

var speed = 110.0

switch speed {
case 0.0..<20.0:
    print("Primeira marcha.")
case 20.0..<40.0:
    print("Segunda marcha.")
case 40.0..<90.0:
    print("Terceira marcha.")
case 90.0..<120.0:
    print("Quarta marcha.")
default:
    print("Quinta marcha.")
}

var letter = "j"

switch letter {
case "a"..<"m":
    print("A letra está na primeira parte do alfabeto.")
default:
    print("A letra está na segunda parte do alfabeto.")
}

enum weekDay: String {
    case sunday = "Domingo"
    case monday = "Segunda"
    case tuesday = "Terça"
    case wednesday = "Quarta"
    case thursday = "Quinta"
    case friday = "Sexta"
    case saturday = "Sábada"
}

var today: weekDay = .friday
print("Hoje é \(today.rawValue)")

enum Measure {
    case age(Int)
    case weight(Double)
    case size(width: Double, height: Double)
}

var measure:Measure = .size(width: 10, height: 20)
switch measure {
case .age(let age):
    print("Idade: \(age)")
case .weight(let weight):
    print("Peso: \(weight)")
case .size(let width, let height): //(let size size.width size.height)
    print("Size: \(width) \(height)")
}

// Classe = Reference Type
// Struct = Value Type

struct Driver {
    var name: String
    var age: Int
    var cnh: String
}

var driver: Driver = Driver(name: "Leandro Romano", age: 21, cnh: "98753897534")
var driver2 = driver
driver2.name = "Carlos"

print(driver.name, driver2.name)

func sayHello(to name: String) {
    print("Olá \(name)")
}

sayHello(to: "Leandro")

var leandro: Driver = Driver.(name: "Leandro", age: 21, cnh: "843824823423")
func registerDriver(_ driver: Driver) {
    
}
registerDriver(leandro)

func sum(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let numbers = sum(10, 20)
