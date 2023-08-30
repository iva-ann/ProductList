//
//  ProductDetailsViewController.swift
//  ProductList
//
//  Created by Анна Иванова on 31.08.2023.
//

import UIKit

final class ProductDetailsViewController: UIViewController {
    
    var presenter: ProductDetailsPresenterProtocolInput?
}

extension ProductDetailsViewController: ProductDetailsPresenterProtocolOutput {}
