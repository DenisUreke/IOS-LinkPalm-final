//
//  DataDownloader.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-07.
//

import Foundation
import Observation

@Observable
class DownloadDataModel{
    
    private let baseURLpersons = "https://randomuser.me/api"
    private let baseURLimages = "https://random.imagecdn.app/v1/image?width=500&height=500&category=buildings&format=json"
    private let baseURLmemes = "https://meme-api.com/gimme/10"
    private let baseURLProducts = "https://dummyjson.com/products"
    
    var isLoading = false
    var personData : PersonDataModel?
    var imagesData : [ImageURLModel] = []
    var memeData: [MemeModel] = []
    var productData: [ProductModel] = []

//--------------------------------------------------------------
    func fetchPersonData() async throws {
        guard let url = URL(string: baseURLpersons) else {
            return
        }
        
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        isLoading = true
        
        let(data, _) = try await URLSession.shared.data(from: url)
        do{
            let feed = try decoder.decode(PersonData.self, from: data)
            if let firstResult = feed.results.first {
                self.personData = PersonDataModel(result: firstResult)
            }
        } catch {
            print("Error fetching person data: \(error)")
        }
        isLoading = false
    }
    
//--------------------------------------------------------------
    
    func fetchImageData() async throws {
        guard let url = URL(string: baseURLimages) else {
            return
        }
        
        let decoder = JSONDecoder()
        
        isLoading = true
        for _ in 0..<10{
            let(data, _) = try await URLSession.shared.data(from: url)
            do{
                let feed = try decoder.decode(ImageURLdata.self, from: data)
                let temp = ImageURLModel(url: feed.url)
                //print("TEMP == \(temp.url)")
                imagesData.append(temp)
                
                //print(feed)
            } catch {
                print("Error fetching image data: \(error)")
            }
        }
        isLoading = false
    }
    
//--------------------------------------------------------------
        
    func fetchMemeData() async throws {
        guard let url = URL(string: baseURLmemes) else {
            return
        }
        
        let decoder = JSONDecoder()
        
        isLoading = true
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try decoder.decode(MemesResponse.self, from: data)
            memeData = decodedResponse.memes.map { memeData -> MemeModel in
                MemeModel(title: memeData.title, url: memeData.url)
            }
        } catch {
            print("Error fetching meme data: \(error)")
        }
        isLoading = false
    }
    
//--------------------------------------------------------------
    
    func fetchProductData() async throws {
        guard let url = URL(string: baseURLProducts) else {
            return
        }
        
        let decoder = JSONDecoder()
        
        isLoading = true
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try decoder.decode(ProductResponse.self, from: data)
            productData = decodedResponse.products.map { ProductModel(from: $0) }
        } catch {
            print("Error fetching product data: \(error)")
        }
        
        isLoading = false
    }
    /*func printFirstEntry() {
        if let firstResult = memeData.first {
            print("AAAAAAAAAAAAA First entry: \(firstResult)")
            print("AAAAAName: \(firstResult.url )")
        } else {
            print("No data available or list is empty.")
        }
    }*/
}
