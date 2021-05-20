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
    
    var items: [Item] = []
    
    
    var itemSelecionado: [Item] = []
    
    // MARK: - Attributes
    var delegate: ViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewItens.dataSource = self
        tableViewItens.delegate = self
        
        let addItem = UIBarButtonItem(title: "adicionar", style: .plain , target: self, action: #selector(self.addItem))
        navigationItem.rightBarButtonItem = addItem
    }
    
     @objc func addItem() {
        let AddItemViewController = AdicionaItensViewController(delegate: self)
        navigationController?.pushViewController(AddItemViewController, animated: true)
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

extension ViewController: AdicionaItensDelegate {
    func addItens(_ item: Item) {
        items.append(item)
        tableViewItens.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let view = segue.destination as? AdicionaItensViewController {
            view.delegate = self
        }
    }
}


