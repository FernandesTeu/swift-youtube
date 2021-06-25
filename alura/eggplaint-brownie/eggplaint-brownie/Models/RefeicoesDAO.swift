//
//  RefeicoesDAO.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 25/06/21.
//

import Foundation

class RefeicoesDAO {
    func saveItems(_ items: [Item]) {
        guard let caminho = FileMangerRefeicoes.fileManagerPath(folderName: "itens") else { return }
        
        do {
            let dadosParaSalvar = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try dadosParaSalvar.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}
