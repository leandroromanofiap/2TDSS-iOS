import Foundation

// Operadores
//+, -, *, /, =, %, !, >, <, >=, <=, &&, ||

//Coleções
//Array: Coleção Ordenada

var invites: [String] = [
    "Jaqueline",
    "Paula",
    "Thiago",
    "Camila",
    "Raquel",
]

invites.append("Carol")

invites.remove(at: 1)

if let index = invites.index(of: "Camila") {
    invites.remove(at: index)
}

invites.contains("Raquel")
