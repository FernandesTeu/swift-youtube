//
//  ContatosUITableViewController.swift
//  estudosios
//
//  Created by Mateus Fernandes Pinto on 04/03/21.
//

import UIKit

class ContatosUITableViewController: UITableViewController {

    lazy var searchController: UISearchController = {
       let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Buscar"
        return search
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

}
