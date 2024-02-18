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
    
     let ID: String
     let userID: String
     
     var boxOne: BoxData
     var boxTwo: BoxData
     var boxThree: BoxData
     var boxFour: BoxData
     var boxFive: BoxData
     var wideBarOne: WideBarData
     var wideBarTwo: WideBarData
     var typeOfContact: String
     var personData: PersonDataModel?
     
     init(userID: String,
          typeOfContact: String,
          boxOne: BoxData = BoxData(),
          boxTwo: BoxData = BoxData(),
          boxThree: BoxData = BoxData(),
          boxFour: BoxData = BoxData(),
          boxFive: BoxData = BoxData(),
          wideBarOne: WideBarData = WideBarData(),
          wideBarTwo: WideBarData = WideBarData(),
          personData: PersonDataModel? = nil) {
         
         self.ID = UUID().uuidString
         self.userID = userID
         self.typeOfContact = typeOfContact
         self.boxOne = boxOne
         self.boxTwo = boxTwo
         self.boxThree = boxThree
         self.boxFour = boxFour
         self.boxFive = boxFive
         self.wideBarOne = wideBarOne
         self.wideBarTwo = wideBarTwo
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
    
    func populateBoxes(meme: [URL]){
        
        self.boxOne.populateContentInBoxesImage(meme: meme[0])
        self.boxTwo.populateContentInBoxesVideo()
        self.boxThree.populateContentInBoxesImage(meme: meme[1])
        self.boxFour.populateContentInBoxesVideo()
        self.boxFive.populateContentInBoxesImage(meme: meme[2])
    }
    
    func createData(imageURL: String, meme: [URL]){
        
        self.designBox(imageURL: imageURL)
        self.populateBoxes(meme: meme)
        
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
    
    func createAndPopulate(components: [String]) {
        Task {
            do {
                
                let (person, memes) = try await fetchData()
                
                DispatchQueue.main.async {
                    if memes.count >= 3 {
                        let randomMemes = Array(memes.shuffled().prefix(3))
                        let urls = randomMemes.compactMap { $0.url } // Extracting URLs from the selected memes
                        // Now urls is an array of URL objects that you can pass as expected
                        
                        let newUser = UserDesignModel(userID: components[0], typeOfContact: components[3], personData: person)
                        newUser.createData(imageURL: newUser.personData?.result.picture.large ?? "", meme: urls)
                        self.userList.append(newUser)
                        self.userList.last!.wideBarOne.wideBarListData.listOfIcons.last!.createHeaderWithName(firstName: person?.result.name.first ?? "Name Not found", lastName: person?.result.name.last ?? "Name Not Found")
                        self.userList.last!.wideBarTwo.wideBarListData.createButtonsForWideBar()
                    }
                    
                    
                    memes.forEach { meme in
                        print("Meme: \(meme.title), URL: \(String(describing: meme.url))")
                    }
                }
            } catch {
                print("An error occurred: \(error)")
            }
        }
    }
}


// https://picsum.photos/300.jpg

//https://picsum.photos/300/300.jpg

//https://picsum.photos/300/300/?blur.jpg

// https://picsum.photos/200/500?grayscale.jpg
