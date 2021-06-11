//
//  FileManager.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 24/05/21.
//

import Foundation

class FileMangerRefeicoes {
    
    static func fileManagerPath(folderName: String) -> URL? {
        let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let caminho = diretorio.first?.appendingPathComponent(folderName) else { return nil }
        return caminho
    }
}
