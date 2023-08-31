//
//  BackendProductModels.swift
//  ProductList
//
//  Created by Анна Иванова on 29.08.2023.
//

import Foundation

struct BackendProductModels: Decodable  {
    
    private enum CodingKeys: String, CodingKey {
        case advertisements = "advertisements"
    }
    
    let advertisements: [ProductBackendModel]
}

struct ProductBackendModel: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case location = "location"
        case imageURL = "image_url"
        case createdDate = "created_date"
        case address = "address"
        case description = "description"
        case email = "email"
        case phoneNumber = "phone_number"

    }
    
    let id: String
    let title: String
    let price: String
    let imageURL: String
    let location: String
    let createdDate: String
    
    var address: String?
    var description: String?
    var email: String?
    var phoneNumber: String?
}
