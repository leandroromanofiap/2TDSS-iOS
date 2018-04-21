//
//  ViewController.swift
//  Navegacao
//
//  Created by Usuário Convidado on 20/04/2018.
//  Copyright © 2018 Usuário Convidado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? SecondViewController else { return }
        
        vc.name = tfName.text!
        
        if sender != nil {
            vc.view.backgroundColor = .yellow
        }
    }

    @IBAction func showGreenViewController(_ sender: Any) {
        performSegue(withIdentifier: "greenSegue", sender: nil)
    }
    
}

