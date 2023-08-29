//
//  ProductListScreenProtocols.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import Foundation

protocol ProductListScreenPresenterInput {
    func getProductListInfo()
    func getProductsCount() -> Int
}
protocol ProductListScreenPresenterOutput: AnyObject {
    func setUpPresenter(_ presenter: ProductListScreenPresenterInput)
    func reloadProductList()
}
