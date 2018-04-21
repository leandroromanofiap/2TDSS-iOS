//
//  SecondViewController.swift
//  Navegacao
//
//  Created by Usuário Convidado on 20/04/2018.
//  Copyright © 2018 Usuário Convidado. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var name: String = "Romano"
    @IBOutlet weak var lbName: UILabel!
    
    override func viewDidLoad() {
        lbName.text = name
        super.viewDidLoad()
    }

    @IBAction func close(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        
        //NavigationController
        navigationController?.popViewController(animated: true)
    }
    
}
