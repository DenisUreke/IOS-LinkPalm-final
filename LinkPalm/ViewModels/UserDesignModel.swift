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
    var boxFive = BoxData()
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

extension UserDesignModel{
    
    func designBox(imageURL: String){
        
        self.boxOne.fillBoxDesignImageOnly(imageURL: imageURL)
        self.boxTwo.fillBoxDesign()
        self.boxThree.fillBoxDesignImageOnly(imageURL: "https://picsum.photos/300/300.jpg")
        self.boxFour.fillBoxDesign()
        self.boxFive.fillBoxDesign()
    }
    
    func populateBoxes(){
        
        self.boxOne.populateContentInBoxesImage()
        self.boxTwo.populateContentInBoxesVideo()
        self.boxThree.populateContentInBoxesImage()
        self.boxFour.populateContentInBoxesVideo()
        self.boxFive.populateContentInBoxesImage()
    }
    
    func createData(imageURL: String){
        
        self.designBox(imageURL: imageURL)
        self.populateBoxes()
        
    }
}

@Observable
class UserDesignList{
    
    var userList: [UserDesignModel] = []
    
    func checkIfContactExists(components: [String]) -> Bool{
        return userList.contains(where: { $0.userID == components[0] })
        
    }
}

extension UserDesignList{
    
    func createAndPopulateUserDesign(components: [String]){
        
        if checkIfContactExists(components: components){
            return
        }else{
            
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
                        var newUser = UserDesignModel(userID: components[0], typeOfContact: components[1], personData: personDataDownload)
                        newUser.createData(imageURL: newUser.personData?.result.picture.large ?? "")
                        self.userList.append(newUser)
                        
                        print("Testing download person: Person Name: \(personDataDownload)")
                    } else {
                        print("Person data is empty.")
                    }
                } catch {
                    print("Error fetching person data: \(error)")
                }
            }
        }
    }

}


// https://picsum.photos/300.jpg

//https://picsum.photos/300/300.jpg

//https://picsum.photos/300/300/?blur.jpg

// https://picsum.photos/200/500?grayscale.jpg
