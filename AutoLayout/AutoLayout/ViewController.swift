//
//  ViewController.swift
//  AutoLayout
//
//  Created by Mateus Fernandes Pinto on 07/04/21.
//

import UIKit

class ViewController: UIViewController {

    
    let box1: UIView = {
        let box = UIView()
        box.backgroundColor = .red
        box.translatesAutoresizingMaskIntoConstraints = false
        return box
    }()
   
    let box2: UIView = {
        let box = UIView()
        box.backgroundColor = .blue
        box.translatesAutoresizingMaskIntoConstraints = false
        return box
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setUpView()
    }
    
    func setUpView() {
        view.addSubview(box1)
        view.addSubview(box2)
        let constraints = [
            box1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            box1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            box1.widthAnchor.constraint(equalToConstant: view.frame.width),
            box1.heightAnchor.constraint(equalToConstant: view.frame.height),
            
            box2.centerXAnchor.constraint(equalTo: view.leftAnchor, constant: 2),
            box2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            box2.widthAnchor.constraint(equalToConstant: view.frame.width),
            box2.heightAnchor.constraint(equalTo: view.widthAnchor),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

