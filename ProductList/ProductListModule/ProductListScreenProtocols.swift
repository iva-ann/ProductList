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
    func getProductModel(for index: Int) -> ProductModel
    func didSelectProduct(at index: Int)
}
protocol ProductListScreenPresenterOutput: AnyObject {
    func setupPresenter(_ presenter: ProductListScreenPresenterInput)
    func reloadProductList()
    func displayErrorView()
}
