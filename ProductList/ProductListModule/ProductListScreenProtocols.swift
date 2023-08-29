//
//  ProductListScreenProtocols.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import Foundation

protocol ProductListScreenPresenterInput {
    func getProductListInfo()
    
}
protocol ProductListScreenPresenterOutput: AnyObject {
    func setUpPresenter(_ presenter: ProductListScreenPresenterInput)
}
