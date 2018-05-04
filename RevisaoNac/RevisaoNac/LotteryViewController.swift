//
//  LotteryViewController.swift
//  RevisaoNac
//
//  Created by Leandro Romano on 27/04/18.
//  Copyright © 2018 Leandro Romano. All rights reserved.
//

import UIKit

class LotteryViewController: UIViewController {
    
    @IBOutlet weak var lbLottery: UILabel!
    var lottery: String = ""
    var color: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbLottery.text = "Esses são os jogos da \(lottery)"
        lbLottery.textColor = color
        title = lottery
    }
    
    deinit {
        
    }
    
}
