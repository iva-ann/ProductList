//
//  ProductDetailsPresenter.swift
//  ProductList
//
//  Created by Анна Иванова on 31.08.2023.
//

import Foundation

final class ProductDetailsPresenter {
    
    private var router: MainRouterProtocol?
    private weak var view: ProductDetailsPresenterProtocolOutput?
    private var productModel: ProductModel
    
    init(router: MainRouterProtocol?,
         productModel: ProductModel,
         view: ProductDetailsPresenterProtocolOutput?) {
        self.router = router
        self.productModel = productModel
        self.view = view
    }
}

extension ProductDetailsPresenter: ProductDetailsPresenterProtocolInput {}
