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
    }
}

