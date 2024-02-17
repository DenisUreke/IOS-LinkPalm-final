//
//  memeData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-16.
//

import Foundation

struct MemeData: Decodable {
    let title: String
    let url: String
}
struct MemesResponse: Decodable {
    let memes: [MemeData]
}
