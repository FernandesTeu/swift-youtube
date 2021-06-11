//
//  RefeicaoServices.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 07/06/21.
//

import Foundation

protocol RefeicoesService {
    func listaRefeicoes() -> [Refeicao]?
    //func saveRefeicoes(_ refeicao: Refeicao) -> Void
}


extension RefeicoesService {
//    func saveRefeicoes(_ refeicao: Refeicao) {
//        <#code#>
//    }
    
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
}
