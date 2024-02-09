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
    
    private let baseURLpersons = "https://randomuser.me/api/?results=10"
    private let baseURLimages = "https://random.imagecdn.app/v1/image?width=500&height=500&category=buildings&format=json"
    
    
    var isLoading = false
    var personData : PersonDataModel?
    var imagesData : [ImageURLModel] = []
    
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
            self.personData = PersonDataModel(results: feed.results)
            //print(feed)
            //printFirstEntry()
        } catch {
            print(error)
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
        for _ in 0..<20{
            let(data, _) = try await URLSession.shared.data(from: url)
            do{
                let feed = try decoder.decode(ImageURLdata.self, from: data)
                let temp = ImageURLModel(url: feed.url)
                //print("TEMP == \(temp.url)")
                imagesData.append(temp)
                
                //print(feed)
            } catch {
                print(error)
            }
        }
        isLoading = false
    }
    
    func printFirstEntry() {
        if let firstResult = personData?.results.first {
            print("AAAAAAAAAAAAA First entry: \(firstResult)")
            print("AAAAAName: \(firstResult.name.first) \(firstResult.name.last) CLOSED")
        } else {
            print("No data available or list is empty.")
        }
    }
}
