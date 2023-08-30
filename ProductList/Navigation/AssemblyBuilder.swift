//
//  AssemblyBuilder.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import Foundation
import UIKit

final class AssemblyBuilder {
    
    func createProductListModule(router: MainRouterProtocol) -> ProductListScreenViewController {
        let productListViewController = ProductListScreenViewController()
        let presenter = ProductListScreenPresenter(router: router,
                                                   view: productListViewController)
        productListViewController.setUpPresenter(presenter)
        return productListViewController
    }
    
    func createProductDetailsScreen(router: MainRouterProtocol,
                                    for productModel: ProductModel) -> ProductDetailsViewController {
        let productDetailsViewController = ProductDetailsViewController()
        let presenter = ProductDetailsPresenter(router: router,
                                                productModel: productModel,
                                                view: productDetailsViewController)
        productDetailsViewController.presenter = presenter
        return productDetailsViewController
    }
}
