//
//  RefeicoesTableViewController.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 19/05/21.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, ViewControllerDelegate {

    var refeicoes: [Refeicao] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func addRefeicao(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cellRef", for: indexPath)
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let ref = refeicoes[indexPath.row]
        cell.textLabel?.text = ref.nome
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
        }
    }
    
    
}
