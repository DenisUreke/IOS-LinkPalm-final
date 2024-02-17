//
//  UserDesignModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import Foundation
import Observation
import SwiftUI
import SwiftData



//@Model
@Observable
final class UserDesignModel: Identifiable{
    
    let ID = UUID().uuidString
    let userID : String
    
    var boxOne = BoxData()
    var boxTwo = BoxData()
    var boxThree = BoxData()
    var boxFour = BoxData()
    var wideBarOne = WideBarData()
    var wideBarTwo = WideBarData()
    var wideBarThree = WideBarData()
    var typeOfContact : String
    var personData : PersonDataModel?
    
    init(userID: String, typeOfContact: String, personData: PersonDataModel? = nil) {
        
        self.userID = userID
        self.typeOfContact = typeOfContact
        self.personData = personData
    }
    
}

@Observable
class UserDesignList{
    
    var userList: [UserDesignModel] = []
    
}

extension UserDesignList{
    
    func createAndPopulateUserDesign(personID: String, typeOfContact: String){

        let downloader = DownloadDataModel()
        
        Task {
            do {
                try await downloader.fetchMemeData()
                // Accessing the title after fetching
                if let firstMemeTitle = downloader.memeData.first?.url {
                    print("Testing download meme : First Meme Title: \(firstMemeTitle)")
                } else {
                    print("Meme data is empty.")
                }
                downloader.printFirstEntry()
            } catch {
                print("Error fetching meme data: \(error)")
            }
        }
        Task {
            do {
                try await downloader.fetchPersonData()
                if let personDataDownload = downloader.personData {
                    var newUser = UserDesignModel(userID: personID, typeOfContact: typeOfContact, personData: personDataDownload)
                    self.userList.append(newUser)
                                
                    print("Testing download person: Person Name: \(personDataDownload)")
                } else {
                    print("Person data is empty.")
                }
            } catch {
                print("Error fetching person data: \(error)")
            }
        }
        /*Task {
         do {
         try await downloader.fetchImageData()
         print("Image path \(downloader.imagesData.last!.url)")
         // After fetching, you might want to do something with the data
         } catch {
         print("Error fetching image data: \(error)")
         }
         }*/
    }
    //-----------------
}


// https://picsum.photos/300.jpg

//https://picsum.photos/300/300.jpg

//https://picsum.photos/300/300/?blur.jpg

// https://picsum.photos/200/500?grayscale.jpg
