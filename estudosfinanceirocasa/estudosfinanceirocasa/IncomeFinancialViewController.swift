//
//  IncomeFinancialViewController.swift
//  estudosfinanceirocasa
//
//  Created by Mateus Fernandes Pinto on 10/06/21.
//

import UIKit

class IncomeFinancialViewController: UIViewController {

    let items: [String] = ["Receitas", "Saldo Anterior"]
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(frame: self.view.bounds)
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = true
        return stack
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    lazy var resumo: UIView = {
        let resumo = UIView(frame: .zero)
        resumo.backgroundColor = .white
        resumo.translatesAutoresizingMaskIntoConstraints = true
        return resumo
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigationBar()
        view.addSubview(stack)
        stack.addArrangedSubview(tableView)
        stack.addArrangedSubview(resumo)
        
//        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: resumo.topAnchor, constant: 400).isActive = true
//
//        resumo.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 30).isActive = true
//        resumo.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        resumo.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        resumo.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        resumo.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 40).isActive = true
    }
    func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
        navigationItem.title = "Entradas"
    
    }
}

extension IncomeFinancialViewController: UITableViewDelegate {
    
}
extension IncomeFinancialViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
