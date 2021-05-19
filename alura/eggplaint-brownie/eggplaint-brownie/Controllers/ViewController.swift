//
//  ViewController.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 17/05/21.
//

import UIKit

// MARK: - Protocols
protocol ViewControllerDelegate {
    func addRefeicao(_ refeicao: Refeicao)
}

class ViewController: UIViewController {

    // MARK: - IBOulet
    @IBOutlet weak var txtNome: UITextField?
    @IBOutlet weak var txtFelicidade: UITextField?
    @IBOutlet weak var tableViewItens: UITableView!
    
    let items: [Item] = [Item(nome: "Passas", calorias: 40.0),
                         Item(nome: "Requeijão", calorias: 40.0),
                         Item(nome: "cebola", calorias: 40.0),
                         Item(nome: "Molho branco", calorias: 40.0)]
    
    
    var itemSelecionado: [Item] = []
    
    // MARK: - Attributes
    var delegate: ViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewItens.dataSource = self
        tableViewItens.delegate = self
    }
   
    // MARK: - IBActions
    @IBAction func adicionar(_ sender: Any) {
        guard let nome = txtNome?.text else { return }
        guard let felicidade = txtFelicidade?.text else { return }
        
        if let valueFeliz = Int(felicidade) {
            //let objRefeicao = Refeicao(nome: nome, felicidade: valueFeliz)
            let objRefeicao = Refeicao(nome: nome, felicidade: valueFeliz, itens: itemSelecionado)
            delegate?.addRefeicao(objRefeicao)
            navigationController?.popViewController(animated: true)
        }else{
            print("erro ao criar uma refeição")
        }
    }
}

// MARK: - Extensions
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.nome
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currentCell = tableView.cellForRow(at: indexPath) else { return }
        
        if currentCell.accessoryType == .none {
            currentCell.accessoryType = .checkmark
            itemSelecionado.append(items[indexPath.row])
        }else{
            let item = items[indexPath.row]
            if let position = itemSelecionado.firstIndex(of: item) {
                currentCell.accessoryType = .none
                itemSelecionado.remove(at: position)
            }
        }
    }
}

