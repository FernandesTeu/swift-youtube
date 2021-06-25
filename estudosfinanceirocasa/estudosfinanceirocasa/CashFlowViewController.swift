//
//  CashFlowViewController.swift
//  estudosfinanceirocasa
//
//  Created by Mateus Fernandes Pinto on 10/06/21.
//

import UIKit

class CashFlowViewController: UIViewController {

    lazy var stack: UIStackView = {
        let stack = UIStackView(frame: self.view.bounds)
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = true
        return stack
    }()
    
    lazy var mainView: UIView = {
        let main = UIView()
        return main
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigationBar()
        view.addSubview(stack)
        stack.addArrangedSubview(mainView)
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
        navigationItem.title = "Lançamentos"
    
    }
}
