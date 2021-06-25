//
//  resumeViewController.swift
//  estudosfinanceirocasa
//
//  Created by Mateus Fernandes Pinto on 11/06/21.
//

import Foundation
import UIKit

class ResumeViewController: UIViewController{
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(frame: self.view.bounds)
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = true
        return stack
    }()
    
    lazy var view1: UIView  = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var stackInter: UIStackView = {
        let stack = UIStackView(frame: self.view.bounds)
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = true
        stack.addArrangedSubview(view1)
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stack)
    }
    
}
