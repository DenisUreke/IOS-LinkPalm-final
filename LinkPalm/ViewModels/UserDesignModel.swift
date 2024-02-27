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
     var userName: String
     var userLastName: String
     var isEditable: Bool
     
     var headerData: BoxData
     var boxOne: BoxData
     var boxTwo: BoxData
     var boxThree: BoxData
     var wideBarOne: WideBarData
     var typeOfContact: TypeOfContact
     var personData: PersonDataModel?
     var productData: ProductModel?
     
     init(userID: String,
          typeOfContact: String,
          userName: String = "",
          userLastName: String = "",
          isEditable: Bool = false,
          headerData: BoxData = BoxData(),
          boxOne: BoxData = BoxData(),
          boxTwo: BoxData = BoxData(),
          boxThree: BoxData = BoxData(),
          wideBarOne: WideBarData = WideBarData(),
          personData: PersonDataModel? = nil,
          productData: ProductModel? = nil) {
         
         self.ID = UUID().uuidString
         self.userID = userID
         self.userName = userName
         self.userLastName = userLastName
         self.isEditable = isEditable
         self.headerData = headerData
         self.typeOfContact = TypeOfContact.from(string: typeOfContact)
         self.boxOne = boxOne
         self.boxTwo = boxTwo
         self.boxThree = boxThree
         self.wideBarOne = wideBarOne
         self.personData = personData
         self.productData = productData
     }
}

extension UserDesignModel{
    
    func createData(imageURL: String, meme: [URL], productImageURL: String, typeOfContact: TypeOfContact, user: UserDesignModel){
        
        self.designBox(imageURL: imageURL, productImageURL: productImageURL, typeOfContact: typeOfContact, user: user)
        self.populateBoxes(meme: meme)
        
    }
    
    func designBox(imageURL: String, productImageURL: String, typeOfContact: TypeOfContact, user: UserDesignModel){
    
        createHeaderWithName(user: user, typeOfContact: user.typeOfContact)
        
        if typeOfContact == .person{
            self.boxOne.fillBoxDesignImageOnly(imageURL: "https://picsum.photos/300/300.jpg")
        }
        else if typeOfContact == .item{
            self.boxOne.fillBoxDesignImageOnly(imageURL: "https://picsum.photos/300/300.jpg")
        }
        else if typeOfContact == .company{
            self.boxOne.fillBoxDesignImageOnly(imageURL: "https://picsum.photos/300/300.jpg")
        }
        self.boxTwo.fillBoxDesign()
        self.boxThree.fillBoxDesignImageOnly(imageURL: "https://picsum.photos/300/300.jpg")
    }
    
    func populateBoxes(meme: [URL]){
        
        self.boxOne.populateContentInBoxesImage(meme: meme[0])
        self.boxTwo.populateContentInBoxesVideo()
        self.boxThree.populateContentInBoxesImage(meme: meme[1])
    }
    
    func createHeaderWithName(user: UserDesignModel, typeOfContact: TypeOfContact){
        
        if typeOfContact == .person
        {
            self.userName = user.personData?.result.name.first ?? "John"
            self.userLastName = user.personData?.result.name.last ?? "Doe"
            self.headerData.boxDesign.imageVideoData.imageData.data.imageURL = URL(string: user.personData?.result.picture.large ?? "https://picsum.photos/300/300.jpg")
        }
        else if typeOfContact == .item
        {
            self.userName = user.productData?.title ?? "Product"
            self.headerData.boxDesign.imageVideoData.imageData.data.imageURL = URL(string: user.productData?.images.first! ?? "https://picsum.photos/300/300.jpg")
        }
        else if typeOfContact == .company
        {
            self.userName = user.productData?.brand ?? "Brand"
            self.headerData.boxDesign.imageVideoData.imageData.data.imageURL = URL(string: user.productData?.images.first! ?? "https://picsum.photos/300/300.jpg")
        }
        user.headerData.boxDesign.text.data.selectedColorFont = randomStandardColor()
    
    }

}

extension UserDesignModel{
    
    func returnCorrectValuesAccordingToEnum(data: UserDesignModel, typeOfContact: TypeOfContact) -> (firstName: String, lastName: String, imageURL: String, typeOfContactSymbol: String) {
        
        var firstName : String = ""
        var lastName : String = ""
        var imageURL : String = ""
        var typeOfContactSymbol : String = ""
        
        if typeOfContact == .person{
            firstName = data.personData?.result.name.first ?? "John"
            lastName = data.personData?.result.name.last ?? "Doe"
            imageURL = data.personData?.result.picture.thumbnail ?? ""
            typeOfContactSymbol = "person.crop.square"
            
        }
        
        if typeOfContact == .item{
            firstName = data.productData?.title ?? "Some Product"
            lastName = ""
            imageURL = data.productData?.thumbnail ?? ""
            typeOfContactSymbol = "tag.square"
        }
        
        if typeOfContact == .company{
            firstName = data.productData?.brand ?? "Company"
            lastName = ""
            imageURL = data.productData?.thumbnail ?? ""
            typeOfContactSymbol = "star.square"
        }
        
        return (firstName, lastName, imageURL, typeOfContactSymbol)
    }
    
}
