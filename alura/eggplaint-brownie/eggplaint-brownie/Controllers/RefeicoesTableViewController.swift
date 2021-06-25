//
//  RefeicoesTableViewController.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 19/05/21.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, ViewControllerDelegate, RefeicoesService {

    var refeicoes: [Refeicao] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //guard let refeicoes = self.listaRefeicoes() else { return }
    }

    internal func addRefeicao(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
        
        guard let caminho = FileMangerRefeicoes.fileManagerPath(folderName: "refeicoes") else { return }
        //testar
        do {
            let dadosParaSalvar = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dadosParaSalvar.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
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
