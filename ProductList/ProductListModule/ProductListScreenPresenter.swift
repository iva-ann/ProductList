//
//  ProductListScreenPresenter.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import Foundation

final class ProductListScreenPresenter {
    
    private var router: MainRouterProtocol?
    private weak var view: ProductListScreenPresenterOutput?
    
    init(router: MainRouterProtocol?,
         view: ProductListScreenPresenterOutput?) {
        self.router = router
        self.view = view
    }
}

extension ProductListScreenPresenter: ProductListScreenPresenterInput {}
