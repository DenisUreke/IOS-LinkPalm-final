//
//  ProductModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-22.
//

import Foundation

class ProductModel {
    let id: Int
    let title: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    var images: [String]
    
    init(from productData: ProductData) {
        self.id = productData.id
        self.title = productData.title
        self.price = productData.price
        self.discountPercentage = productData.discountPercentage
        self.rating = productData.rating
        self.stock = productData.stock
        self.brand = productData.brand
        self.category = productData.category
        self.thumbnail = productData.thumbnail
        self.images = productData.images
    }
}
