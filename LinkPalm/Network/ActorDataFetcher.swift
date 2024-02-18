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
}

func fetchData() async throws -> (PersonDataModel?, [MemeModel]) {
    let dataFetcher = DataFetcher()

    try await dataFetcher.fetchPersonData()
    let person = await dataFetcher.personData

    try await dataFetcher.fetchMemeData()
    let memes = await dataFetcher.memeData

    return (person, memes)
}
