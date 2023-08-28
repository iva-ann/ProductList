//
//  ProductListScreenViewController.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import UIKit

final class ProductListScreenViewController: UIViewController {
    
    var presenter: ProductListScreenPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProductListScreenViewController: ProductListScreenPresenterOutput {}
