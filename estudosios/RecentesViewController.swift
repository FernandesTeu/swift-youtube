//
//  ContatosUITableViewController.swift
//  estudosios
//
//  Created by Mateus Fernandes Pinto on 04/03/21.
//

import UIKit

class RecentesViewController: UITableViewController {

    @IBOutlet var segmentController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = segmentController
    }


}
