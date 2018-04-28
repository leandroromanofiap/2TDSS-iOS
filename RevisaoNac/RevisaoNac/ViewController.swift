//
//  ViewController.swift
//  RevisaoNac
//
//  Created by Leandro Romano on 27/04/18.
//  Copyright © 2018 Leandro Romano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? LotteryViewController else { return }
        
        guard let button = sender as? UIButton else { return }
        
        guard let currentTitleButton = button.currentTitle else { return }
        vc.lottery = currentTitleButton
        vc.color = button.currentTitleColor
    }
    
    @IBAction func showLottery(_ sender: UIButton) {
        performSegue(withIdentifier: "segue", sender: sender)
    }

}

