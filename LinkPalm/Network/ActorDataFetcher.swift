//
//  ActorDataFetcher.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-17.
//

import Foundation

actor DataFetcher {
    var personData: PersonDataModel?
    var memeData: [MemeModel] = []
    var productData: [ProductModel] = []
    private let downloader = DownloadDataModel()

    func fetchPersonData() async throws {
        do {
            try await downloader.fetchPersonData()
            self.personData = downloader.personData
        } catch {
            throw error
        }
    }
    func fetchMemeData() async throws {
        do {
            try await downloader.fetchMemeData()
            self.memeData = downloader.memeData
        } catch {
            throw error
        }
    }
    
    func fetchProductData() async throws {
        do {
            try await downloader.fetchProductData()
            self.productData = downloader.productData
        } catch {
            throw error
        }
    }
}

func fetchData() async throws -> (PersonDataModel?, [MemeModel], [ProductModel]) {
    let dataFetcher = DataFetcher()

    try await dataFetcher.fetchPersonData()
    let person = await dataFetcher.personData

    try await dataFetcher.fetchMemeData()
    let memes = await dataFetcher.memeData
    
    try await dataFetcher.fetchProductData()
    let products = await dataFetcher.productData

    return (person, memes, products)
}
