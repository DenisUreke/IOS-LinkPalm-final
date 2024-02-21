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
