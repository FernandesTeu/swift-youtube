//
//  RefeicaoServices.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 07/06/21.
//

import Foundation

protocol RefeicoesService {
    func listaRefeicoes() -> [Refeicao]?
    func listaItems() -> [Item]?
}


extension RefeicoesService {

    func listaRefeicoes() -> [Refeicao]? {
        guard let caminho = FileMangerRefeicoes.fileManagerPath(folderName: "refeicoes") else { return nil }

        do {
            let dados = try Data(contentsOf: caminho)
            let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados)
            guard let refeicoesArray = refeicoesSalvas as? Array<Refeicao> else { return nil }
            return refeicoesArray
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func listaItems() -> [Item]? {
        guard let caminho = FileMangerRefeicoes.fileManagerPath(folderName: "itens") else {
            return nil
        }
        
        do {
            let dados = try Data(contentsOf: caminho)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados)
            guard let itemsArray = itensSalvos as? Array<Item> else {
                return nil
            }
            return itemsArray
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
