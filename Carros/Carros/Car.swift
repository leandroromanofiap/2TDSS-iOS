//
//  Car.swift
//  Carros
//
//  Created by Leandro Romano on 10/08/18.
//  Copyright © 2018 Leandro Romano. All rights reserved.
//

import Foundation

struct Car : Codable {
    var _id: String = ""
    var brand: String = ""
    var name: String = ""
    var gasType: Int = 0
    var price: Double = 0.0
}
