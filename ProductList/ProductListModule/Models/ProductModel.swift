//
//  ProductModel.swift
//  ProductList
//
//  Created by Анна Иванова on 30.08.2023.
//

import UIKit

struct ProductModel {
    let id: String
    let title: String
    let price: String
    let image: UIImage
    let location: String
    let createdDate: String
    
    var address: String?
    var description: String?
    var email: String?
    var phoneNumber: String?
}
