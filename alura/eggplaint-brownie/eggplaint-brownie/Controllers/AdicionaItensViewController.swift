//
//  AdicionaItensViewController.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 19/05/21.
//

import UIKit

protocol AdicionaItensDelegate {
    func addItens(_ item: Item)
}

class AdicionaItensViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    var delegate: AdicionaItensDelegate?
    let nibNameView: String = "AdicionaItensViewController"
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: nibNameView, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func recuperaItemDoFormulario() -> Item? {
        guard let nomeItem = nomeTextField.text else {
            Alerta(controller: self).exibe(mensagem: "Error ao ler o campo nome")
            return nil
        }
        
        guard let calorias = caloriasTextField.text else {
            Alerta(controller: self).exibe(mensagem: "Error ao ler o campo Calorias")
            return nil
        }
        
        guard let caloriasDouble = Double(calorias) else {
            Alerta(controller: self).exibe(mensagem: "Error ao converter Calorias")
            return nil
        }
        
        let item = Item(nome: nomeItem, calorias: caloriasDouble)
        return item
    }
    
    @IBAction func addItem() {
        
        guard let itemCardapio = recuperaItemDoFormulario() else {
            Alerta(controller: self).exibe(mensagem: "Nenhum Item Cadastrado")
            return
        }
        delegate?.addItens(itemCardapio)
        navigationController?.popViewController(animated: true)
    }
}
