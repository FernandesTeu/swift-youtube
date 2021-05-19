//
//  Item.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 18/05/21.
//

import UIKit

class Item: NSObject {

    var nome:String
    var calorias: Double
    
    init(nome:String, calorias:Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
