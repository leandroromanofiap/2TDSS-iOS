//
//  ViewController.swift
//  Imagens
//
//  Created by Leandro Romano on 11/05/18.
//  Copyright © 2018 Leandro Romano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ivTrapalhoes: UIImageView!
    
    let trapalhoes = ["didi", "dede", "mussum", "zacarias"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ivTrapalhoes.layer.cornerRadius = ivTrapalhoes.frame.size.height / 2
        ivTrapalhoes.layer.borderColor = UIColor.white.cgColor
    }

    @IBAction func changePicture(_ sender: UISegmentedControl) {
        ivTrapalhoes.stopAnimating()
        
        let imageName = trapalhoes[sender.selectedSegmentIndex];
        
        ivTrapalhoes.image = UIImage(named: imageName)
    }
    
    @IBAction func changeBorder(_ sender: UISlider) {
        ivTrapalhoes.layer.borderWidth = CGFloat(sender.value)
    }
    
    @IBAction func playAnimation(_ sender: UIButton) {
        ivTrapalhoes.layer.cornerRadius = 0
        ivTrapalhoes.layer.borderWidth = 0
        ivTrapalhoes.contentMode = .scaleAspectFit
        
        var images: [UIImage] = []
        for index in 1...68 {
            if let i = UIImage(named: "HomemAndando\(index).png") {
                images.append(i)
            }
        }
        
        ivTrapalhoes.animationImages = images
        ivTrapalhoes.animationDuration = 2
        ivTrapalhoes.animationRepeatCount = 0
        ivTrapalhoes.startAnimating()
    }
}

