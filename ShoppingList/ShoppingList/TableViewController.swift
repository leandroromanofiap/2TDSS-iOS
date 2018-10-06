//
//  TableViewController.swift
//  ShoppingList
//
//  Created by Usuário Convidado on 25/08/2018.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class TableViewController: UITableViewController {
    
    var user: User!
    var firestore: Firestore = {
        let settings = FirestoreSettings()
        settings.areTimestampsInSnapshotsEnabled = true
        settings.isPersistenceEnabled = true
        
        let firestore = Firestore.firestore()
        firestore.settings = settings
        
        return firestore
    }()
    var firestoreListener: ListenerRegistration!
    var shoppingListCollection = "shoppingList"
    var shoppingList: [ShoppingItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        user = Auth.auth().currentUser
        title = user.displayName
        loadItems()
    }
    
    func loadItems() {
        firestoreListener = firestore.collection(shoppingListCollection)
            .order(by: "name")
            .addSnapshotListener(includeMetadataChanges: true, listener: { (snapshot, error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    guard let snapshot = snapshot else { return }
                    
                    if snapshot.metadata.isFromCache || snapshot.documentChanges.count > 0 {
                        self.showItems(snapshot: snapshot)
                    }
                }
        })
    }
    
    func showItems(snapshot: QuerySnapshot) {
        shoppingList.removeAll()
        
        for document in snapshot.documents {
            let data = document.data()
            
            let name = data["name"] as! String
            let quantity = data["quantity"] as! Int
            
            let shoppingItem = ShoppingItem(id: document.documentID, name: name, quantity: quantity)
            
            shoppingList.append(shoppingItem)
        }
        
        tableView.reloadData()
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        let data: [String: Any] = [
            "name": "PARTIU PIZZINHA",
            "quantity": 4
        ]
        
        firestore.collection(shoppingListCollection).addDocument(data: data) { (error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print("Item adicionado com sucesso.")
            }
        }
    }
    
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") else { return }
            navigationController?.viewControllers = [mainVC]
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let shoppingItem = shoppingList[indexPath.row]
        
        cell.textLabel?.text = shoppingItem.name
        cell.detailTextLabel?.text = "\(shoppingItem.quantity)"

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let shoppingItem = shoppingList[indexPath.row]
            firestore.collection(shoppingListCollection).document(shoppingItem.id).delete()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shoppingItem = shoppingList[indexPath.row]
        
        let data: [String: Any] = [
            "name": shoppingItem.name,
            "quantity": Int(arc4random_uniform(30) + 1)
        ]
        
        firestore.collection(shoppingListCollection).document(shoppingItem.id).updateData(data)
    }

}
