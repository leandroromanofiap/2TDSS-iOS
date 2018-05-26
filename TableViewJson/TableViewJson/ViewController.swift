//
//  ViewController.swift
//  TableViewJson
//
//  Created by Leandro Romano on 25/05/18.
//  Copyright © 2018 Leandro Romano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ivConsole: UIImageView!
    @IBOutlet weak var lbManufacturer: UILabel!
    @IBOutlet weak var lbReleaseDate: UILabel!
    @IBOutlet weak var lbUnitsSold: UILabel!
    
    var console: Console!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = console.name
        
        lbManufacturer.text = "Fabricante: \(console.manufacturer)"
        lbReleaseDate.text = "Lançamento: \(console.releaseDate)"
        lbUnitsSold.text = "Unidades vendidas: \(console.unitsSold)"
        
        ivConsole.image = UIImage(named: console.image)
    }

}
