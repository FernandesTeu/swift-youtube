//
//  Alerta.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 21/05/21.
//

import Foundation
import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(titulo: String = "ATENÇÃO", mensagem: String) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let btnOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(btnOk)
        controller.present(alerta, animated: true, completion: nil)
    }
}
