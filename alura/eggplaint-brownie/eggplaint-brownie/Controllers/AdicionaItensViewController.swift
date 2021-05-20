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
    
    @IBAction func addItem() {
        
        guard let nomeItem = nomeTextField.text else { return }
        guard let calorias = caloriasTextField.text else { return }
        
        if let caloriasDouble =  Double(calorias) {
            let item = Item(nome: nomeItem, calorias: caloriasDouble)
            delegate?.addItens(item)
            navigationController?.popViewController(animated: true)
        }
    }
}
