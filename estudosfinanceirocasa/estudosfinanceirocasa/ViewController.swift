//
//  ViewController.swift
//  estudosfinanceirocasa
//
//  Created by Mateus Fernandes Pinto on 10/06/21.
//

import UIKit

class ViewController: UIViewController {

     lazy var dashboard: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var cards: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var schedule: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var menu: UITabBar = {
        let menu = UITabBar()
        
        return menu
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(frame: self.view.bounds)
        stack.translatesAutoresizingMaskIntoConstraints = true
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpNavigationBar()
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addArrangedSubview(dashboard)
        stackView.addArrangedSubview(cards)
        stackView.addArrangedSubview(schedule)
        
        
        
        
        
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
        navigationItem.title = "Dashboard"
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //navigationController?.navigationBar.isHidden = true
    }

}

