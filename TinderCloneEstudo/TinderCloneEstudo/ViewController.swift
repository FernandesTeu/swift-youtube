//
//  ViewController.swift
//  TinderCloneEstudo
//
//  Created by Mateus Fernandes Pinto on 11/06/21.
//

import UIKit

class ViewController: UIViewController {

    lazy var card: UIView = {
        let card = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        card.center = view.center
        card.backgroundColor = .red
        return card
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(card)
        
        let gestureCard = UIPanGestureRecognizer()
        gestureCard.addTarget(self, action: #selector(handlerCard))
        
        card.addGestureRecognizer(gestureCard)
    }
}

extension ViewController {
    
    @objc func handlerCard(gesture: UIPanGestureRecognizer) {
        if let card = gesture.view {
            let point = gesture.translation(in: view)
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            
            if gesture.state == .ended {
                UIView.animate(withDuration: 0.2) {
                    card.center = self.view.center
                }
            }
        }
    }
}

