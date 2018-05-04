//
//  ViewController.swift
//  RevisaoNac2
//
//  Created by Leandro Romano on 04/05/18.
//  Copyright © 2018 Leandro Romano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? SecondViewController else { return }
        
        vc.score = 10
    }

    @IBAction func callSecondViewController(_ sender: UIButton) {
        performSegue(withIdentifier: "segue", sender: sender)
    }
    

}

