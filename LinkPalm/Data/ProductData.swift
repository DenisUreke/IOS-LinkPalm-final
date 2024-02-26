//
//  ProductData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-22.
//

import Foundation

struct ProductData: Decodable {
    let id: Int
    let title: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}

struct ProductResponse: Decodable {
    let products: [ProductData]
}
