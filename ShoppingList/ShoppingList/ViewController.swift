//
//  ViewController.swift
//  ShoppingList
//
//  Created by Usuário Convidado on 25/08/2018.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func login(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: tfEmail.text!, password: tfPassword.text!) { (result, error) in
            if error == nil {
                print("Usuário logado com sucesso!")
                self.updateUserAndProceed()
            } else {
                print(error!.localizedDescription)
            }
        }
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: tfEmail.text!, password: tfPassword.text!) { (result, error) in
            if error == nil {
                print("Conta criada com sucesso!")
                self.updateUserAndProceed()
            } else {
                print(error!.localizedDescription)
            }
        }
    }
    
    func updateUserAndProceed() {
        if tfName.text!.isEmpty {
            showMainScreen()
        } else {
            guard let user = Auth.auth().currentUser else { return }
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = tfName.text!
            changeRequest.commitChanges { (error) in
                if error == nil {
                    print("Nome atribuído com sucesso!")
                } else {
                    print(error!.localizedDescription)
                }
                self.showMainScreen()
            }
        }
    }
    
    func showMainScreen() {
        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "TableViewController") else { return }
        navigationController?.viewControllers = [mainVC]
    }
}

