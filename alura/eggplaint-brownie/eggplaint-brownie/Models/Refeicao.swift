//
//  Refeicao.swift
//  eggplaint-brownie
//
//  Created by Mateus Fernandes Pinto on 18/05/21.
//

import UIKit

class Refeicao: NSObject {

    var nome:String
    var felicidade: Int
    var Itens: Array<Item> = []
    
    init(nome:String, felicidade:Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.Itens = itens
    }
    
}
