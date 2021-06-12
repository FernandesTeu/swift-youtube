//
//  TinderServices.swift
//  TinderCloneEstudo
//
//  Created by Mateus Fernandes Pinto on 12/06/21.
//

import Foundation

class TinderServices {
    
    static let shared = TinderServices()
    
    func buscaUsuarios() -> [Tinders] {
        return build()
    }
    
    func build() -> [Tinders]{
        var tindersUsers: [Tinders] = []
        
            tindersUsers.append(Tinders(id: 101, nome: "Alana", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-1"))
            tindersUsers.append(Tinders(id: 102, nome: "Monique", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-2"))
            tindersUsers.append(Tinders(id: 103, nome: "Victoria", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-3"))
            tindersUsers.append(Tinders(id: 104, nome: "Brenda", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-4"))
            tindersUsers.append(Tinders(id: 105, nome: "Tâmara", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-5"))
            tindersUsers.append(Tinders(id: 106, nome: "Bárbara", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-6"))
            tindersUsers.append(Tinders(id: 107, nome: "Monique", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-7"))
            tindersUsers.append(Tinders(id: 103, nome: "Victoria", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-8"))
            tindersUsers.append(Tinders(id: 109, nome: "Brenda", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-9"))
            tindersUsers.append(Tinders(id: 110, nome: "Cinthia", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-10"))
            tindersUsers.append(Tinders(id: 111, nome: "Ludmila", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-11"))
            tindersUsers.append(Tinders(id: 112, nome: "Jéssica", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-12"))
            tindersUsers.append(Tinders(id: 113, nome: "Rafaela", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-13"))
            tindersUsers.append(Tinders(id: 114, nome: "Vanessa", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-14"))
            tindersUsers.append(Tinders(id: 115, nome: "Cristiane", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-15"))
            tindersUsers.append(Tinders(id: 116, nome: "Ana Beatriz", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-16"))
            tindersUsers.append(Tinders(id: 117, nome: "Valkiria", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-17"))
            tindersUsers.append(Tinders(id: 118, nome: "Josiane", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-18"))
            tindersUsers.append(Tinders(id: 119, nome: "Micaela", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-19"))
            tindersUsers.append(Tinders(id: 120, nome: "Andrezza", idade: 20, match: true, frase: "Te encontro pelo Mundo", foto: "pessoa-20"))
        
        return tindersUsers
    }
}
