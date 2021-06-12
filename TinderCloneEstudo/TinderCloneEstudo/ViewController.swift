//
//  ViewController.swift
//  TinderCloneEstudo
//
//  Created by Mateus Fernandes Pinto on 11/06/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
       addCards()
    }
}

extension ViewController {
    
    @objc func handlerCard(gesture: UIPanGestureRecognizer) {
        if let card = gesture.view {
            let point = gesture.translation(in: view)
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            
            let rotateAngle = point.x / view.bounds.width * 0.4
            card.transform = CGAffineTransform(rotationAngle: rotateAngle)
            
            if gesture.state == .ended {
                UIView.animate(withDuration: 0.2) {
                    card.center = self.view.center
                    card.transform = .identity
                    
                }
            }
        }
    }
    
    
    func addCards() {
        for item in 1...3 {
            
            let card = CardView()
            card.frame =  CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: view.bounds.height * 0.7)
            card.center = view.center
            
            view.addSubview(card)
            
            let gestureCard = UIPanGestureRecognizer()
            gestureCard.addTarget(self, action: #selector(handlerCard))
            
            card.addGestureRecognizer(gestureCard)
        }
    }
}

