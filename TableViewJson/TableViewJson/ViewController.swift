//
//  ViewController.swift
//  TableViewJson
//
//  Created by Leandro Romano on 25/05/18.
//  Copyright © 2018 Leandro Romano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Instance Variables
    
    var console: Console!
    
    // MARK: - Outlets
    
    @IBOutlet weak var ivConsole: UIImageView!
    @IBOutlet weak var lbManufacturer: UILabel!
    @IBOutlet weak var lbReleaseDate: UILabel!
    @IBOutlet weak var lbUnitsSold: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FIXME: Refactor this!
        title = console.name
        
        lbManufacturer.text = "Fabricante: \(console.manufacturer)"
        lbReleaseDate.text = "Lançamento: \(console.releaseDate)"
        lbUnitsSold.text = "Unidades vendidas: \(console.unitsSold)"
        
        ivConsole.image = UIImage(named: console.image)
    }

}
