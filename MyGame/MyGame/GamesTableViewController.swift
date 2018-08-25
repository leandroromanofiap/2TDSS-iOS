//
//  GamesTableViewController.swift
//  MyGame
//
//  Created by Usuário Convidado on 24/08/2018.
//  Copyright © 2018 Leandro Romano. All rights reserved.
//

import UIKit
import CoreData

class GamesTableViewController: UITableViewController {

    var fetchedResultController: NSFetchedResultsController<Game>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGames()
    }
    
    func loadGames() {
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        let sortDescriptor: NSSortDescriptor = NSSortDescriptor(key: "console", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultController.delegate = self
        
        try? fetchedResultController.performFetch()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if sender is UITableViewCell {}
        
        guard let _ = sender as? UITableViewCell else { return }
        
        guard let vc = segue.destination as? GameViewController else { return }
        
        let game = fetchedResultController.object(at: tableView.indexPathForSelectedRow!)
        
        vc.game = game
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultController.fetchedObjects?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let game = fetchedResultController.object(at: indexPath)
        
        cell.textLabel?.text = game.console
        cell.detailTextLabel?.text = game.name

        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let game = fetchedResultController.object(at: indexPath)
            
            context.delete(game)
            try? context.save()
        }
    }
 

}

extension GamesTableViewController : NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        tableView.reloadData()
    }
    
}
