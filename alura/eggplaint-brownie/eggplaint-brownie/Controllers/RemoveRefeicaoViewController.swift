//
//  RemoveRefeicaoViewController.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 21/05/21.
//

import Foundation
import UIKit

class RemoveRefeicaoViewController {
    
    let viewController: UIViewController
    init(controller: UIViewController) {
        self.viewController = controller
    }
    
    func removeRefeicao(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let btnCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let btnRemover = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
        alert.addAction(btnCancel)
        alert.addAction(btnRemover)
        viewController.present(alert, animated: true, completion: nil)
    }
}
