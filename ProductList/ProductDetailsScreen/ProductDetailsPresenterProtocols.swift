//
//  ProductDetailsPresenterProtocols.swift
//  ProductList
//
//  Created by Анна Иванова on 31.08.2023.
//

import Foundation

protocol ProductDetailsPresenterProtocolInput {
    func getProductDetailsInfo()
}

protocol ProductDetailsPresenterProtocolOutput: AnyObject {
    func configure(with model: ProductModel)
}
