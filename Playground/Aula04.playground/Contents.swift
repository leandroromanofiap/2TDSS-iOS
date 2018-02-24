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

// Dictionary
var states = [
    "SP": "São Paulo",
    "MG": "Minas Gerais",
    "PA": "Pará"
]

if let state = states["PA"] {
    print(state)
}

if let _ = states["SP"] {
    print("Tem SP!")
} else {
    print("Não tem SP!")
}

states["RJ"] = "Rio de Janeiro"
states["RJ"] = nil
states

states.count
"FIAP".count

for invite in invites {
    print("\(invite) foi convidada para a festa.")
}

for state in states {
    print("A chave \(state.key) se refere a \(state.value)")
}

let address: (street: String, number: Int, zipCode: String) = ("Av. Paulista", 1200, "01310-100")
var (street, number, zipCode) = address

for i in 0..<invites.count {
    print("O convidado \(i + 1) é \(invites[i])")
}

// Operador unario
prefix operator  >-
prefix func >- (rhs: Int) -> Int {
    return rhs * rhs
}
>-4

postfix operator  -<
postfix func -< (lhs: Int) -> Int {
    return lhs * lhs * lhs
}
2-<

infix operator  >-<
func >-< (lhs: Int, rhs: Int) -> String {
    return "\(lhs)\(rhs)"
}
20>-<18

arc4random_uniform(60)



