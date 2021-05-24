//
//  Item.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 18/05/21.
//

import UIKit

class Item: NSObject, NSCoding {
    
    var nome:String
    var calorias: Double
    
    init(nome:String, calorias:Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        calorias = coder.decodeDouble(forKey: "calorias")
    }
}
