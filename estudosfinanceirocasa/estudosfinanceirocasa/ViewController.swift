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
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    lazy var saldo: UIView = {
       let view = UIView()
        view.backgroundColor = .systemTeal
       view.translatesAutoresizingMaskIntoConstraints = true
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
    
    lazy var teste: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
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
    
    private lazy var interStack: UIStackView = {
        let stack = UIStackView(frame: self.view.bounds)
        stack.translatesAutoresizingMaskIntoConstraints = true
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 5
        stack.addArrangedSubview(dashboard)
        return stack
    }()
    
    
    lazy var month: UILabel = {
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        title.text = "Junho/21"
        title.translatesAutoresizingMaskIntoConstraints = true
        title.sizeToFit()
        title.tintColor = .white
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpNavigationBar()
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addArrangedSubview(interStack)
        stackView.addArrangedSubview(cards)
        stackView.addArrangedSubview(schedule)
        dashboard.addSubview(month)
        
        NSLayoutConstraint.activate([
            interStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            month.topAnchor.constraint(equalTo: self.view.topAnchor),
            month.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            month.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            month.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            month.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 20)
        ])
       
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
        navigationItem.title = "Dashboard"
        navigationController?.navigationBar.isTranslucent = false
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //navigationController?.navigationBar.isHidden = true
    }

}

