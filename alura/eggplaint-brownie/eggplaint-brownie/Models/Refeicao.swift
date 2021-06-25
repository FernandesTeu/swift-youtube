//
//  Refeicao.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 18/05/21.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    var nome:String
    var felicidade: Int
    var itens: Array<Item> = []
    
    init(nome:String, felicidade:Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        felicidade = coder.decodeInteger(forKey: "felicidade")
        itens = coder.decodeObject(forKey: "itens") as! Array<Item>
        
    }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade) \n"
        for item in itens {
            mensagem += ",\(item.nome) - Calorias: \(item.calorias)"
        }

        return mensagem
    }
}
