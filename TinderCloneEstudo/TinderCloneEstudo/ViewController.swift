//
//  ViewController.swift
//  TinderCloneEstudo
//
//  Created by Mateus Fernandes Pinto on 11/06/21.
//

import UIKit

class ViewController: UIViewController {

    var tinders: [Tinders] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        carregaUsuarios()
       
    }
    
    func carregaUsuarios()  {
        tinders = TinderServices.shared.buscaUsuarios()
        addCards()
    }
}

extension ViewController {
    
    @objc func handlerCard(gesture: UIPanGestureRecognizer) {
        if let card = gesture.view  as? CardView{
            let point = gesture.translation(in: view)
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            
            let rotateAngle = point.x / view.bounds.width * 0.4
            card.transform = CGAffineTransform(rotationAngle: rotateAngle)
            
            if point.x > 0 {
                card.likeImageView.alpha = rotateAngle * 5
                card.deslikeImageView.alpha = 0
            }else {
                card.likeImageView.alpha = 0
                card.deslikeImageView.alpha = rotateAngle * 5 * -1
            }
            
            if gesture.state == .ended {
                UIView.animate(withDuration: 0.2) {
                    card.center = self.view.center
                    card.transform = .identity
                    card.deslikeImageView.alpha = 0
                    card.likeImageView.alpha = 0
                }
            }
        }
    }
    
    
    func addCards() {
        for tinder in tinders {
            
            let card = CardView()
            card.frame =  CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: view.bounds.height * 0.7)
            card.center = view.center
           
            card.usuarioTinder = tinder
            card.tag = tinder.id
          
            
            view.insertSubview(card, at: 0)
            
            let gestureCard = UIPanGestureRecognizer()
            gestureCard.addTarget(self, action: #selector(handlerCard))
            
            card.addGestureRecognizer(gestureCard)
        }
    }
    
    func addUsuariosTinder() {
        
    }
}

