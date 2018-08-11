//
//  API.swift
//  Carros
//
//  Created by Leandro Romano on 10/08/18.
//  Copyright © 2018 Leandro Romano. All rights reserved.
//

import Foundation

class API {
    
    static let path = "https://carangas.herokuapp.com/cars"
    static let session = URLSession.shared
    
    
    class func loadCars(onComplete: @escaping ([Car]) -> Void) {
        guard let url = URL(string: path) else {
            print("URL inválida.")
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Deu ruim!", error!.localizedDescription)
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("O servidor não respondeu.")
                return
            }
            
            if response.statusCode != 200 {
                print("Servidor respondeu com o código: ", response.statusCode)
                return
            }
            
            guard let data = data else {
                print("O resultado da chamada é nulo.")
                return
            }
            
            do {
                let cars = try JSONDecoder().decode([Car].self, from: data)
                onComplete(cars)
            } catch {
                print("JSON Inválido. ", error.localizedDescription)
            }
        }
        
        dataTask.resume()
    }
    
}
