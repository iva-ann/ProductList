//
//  ProductListScreenViewController.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import UIKit

final class ProductListScreenViewController: UIViewController {
    
    private var presenter: ProductListScreenPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    private func initialSetup() {
        presenter?.getProductListInfo()
    }
}

extension ProductListScreenViewController: ProductListScreenPresenterOutput {
    func setUpPresenter(_ presenter: ProductListScreenPresenterInput) {
        self.presenter = presenter
    }
}
