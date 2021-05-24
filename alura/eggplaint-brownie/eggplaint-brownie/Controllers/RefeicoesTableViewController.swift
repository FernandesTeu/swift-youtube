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

    internal func addRefeicao(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let cell = gesture.view as! UITableViewCell
            guard let indexpath = tableView.indexPath(for: cell) else { return }
            let refeicaoSelecionada = refeicoes[indexpath.row]
            RemoveRefeicaoViewController(controller: self).removeRefeicao(refeicaoSelecionada) { (alert) in
                self.refeicoes.remove(at: indexpath.row)
                self.tableView.reloadData()
            }
        }
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cellRef", for: indexPath)
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let ref = refeicoes[indexPath.row]
        cell.textLabel?.text = ref.nome
        
        // usar o long press na celula da tableview
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
        }
    }
    
    
}
