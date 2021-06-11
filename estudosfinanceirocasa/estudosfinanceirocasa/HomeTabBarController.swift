//
//  HomeTabBarController.swift
//  estudosfinanceirocasa
//
//  Created by Mateus Fernandes Pinto on 10/06/21.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVcs()

        // Do any additional setup after loading the view.
    }
    
    func setupVcs() {
        viewControllers = [
            createNavController(for: ViewController(), title: "Home", image: UIImage(systemName: "house")!),
            createNavController(for: FinancialForecastViewController(), title: "Previsão", image: UIImage(systemName: "list.bullet.rectangle")!),
            createNavController(for: CashFlowViewController(), title: "Lançamentos", image: UIImage(systemName: "pencil")!),
            createNavController(for: IncomeFinancialViewController(), title: "Entradas", image: UIImage(systemName: "bookmark")!),
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
