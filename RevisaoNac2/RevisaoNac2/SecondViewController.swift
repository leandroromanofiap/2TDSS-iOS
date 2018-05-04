//
//  SecondViewController.swift
//  RevisaoNac2
//
//  Created by Leandro Romano on 04/05/18.
//  Copyright © 2018 Leandro Romano. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lbExameScore: UILabel!
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Resultado"
        lbExameScore.text = "Você tirou a nota \(score) na NAC 2!"
    }

}
