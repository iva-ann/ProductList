//
//  MainRouter.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import UIKit

protocol MainRouterProtocol: AnyObject {}

final class MainRouter {
    
    private let navigationController: UINavigationController
    private let assemblyBuilder: AssemblyBuilder = AssemblyBuilder()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startFlow() {
        let prodauctListScreen = assemblyBuilder.createProductListModule(router: self)
        navigationController.pushViewController(prodauctListScreen, animated: true)
    }
}

extension MainRouter: MainRouterProtocol {}
