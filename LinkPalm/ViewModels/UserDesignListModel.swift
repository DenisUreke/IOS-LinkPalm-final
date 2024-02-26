//
//  UserDesignListModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-21.
//

import Foundation
import Observation
import SwiftUI

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
                
                let (person, memes, products) = try await fetchData()
                
                DispatchQueue.main.async {
                    if memes.count >= 3 {
                        let randomMemes = Array(memes.shuffled().prefix(3))
                        let urls = randomMemes.compactMap { $0.url }
                        let randomProduct = products.randomElement()
                        
                        let newUser = UserDesignModel(userID: components[0], typeOfContact: components[3], personData: person, productData: randomProduct)
                        newUser.createData(imageURL: newUser.personData?.result.picture.large ?? "", meme: urls, productImageURL: randomProduct?.images.first! ?? "https://picsum.photos/300/300.jpg", typeOfContact: newUser.typeOfContact, user: newUser)
                        self.userList.append(newUser)
                        self.userList.last!.wideBarOne.wideBarListData.createButtonsForWideBar()
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
    
    func returnCorrectValuesAccordingToEnum(data: UserDesignModel, typeOfContact: TypeOfContact) -> (firstName: String, lastName: String, imageURL: String) {
        
        var firstName : String = ""
        var lastName : String = ""
        var imageURL : String = ""
        
        if typeOfContact == .person{
            firstName = data.personData?.result.name.first ?? "John"
            lastName = data.personData?.result.name.last ?? "Doe"
            imageURL = data.personData?.result.picture.large ?? ""
        }
        
        if typeOfContact == .item{
            firstName = data.productData?.title ?? "Some Product"
            lastName = ""
            imageURL = data.productData?.images.first! ?? ""
        }
        
        if typeOfContact == .company{
            firstName = data.productData?.brand ?? "Some Company"
            lastName = ""
            imageURL = data.productData?.images.first! ?? ""
        }
        
        return (firstName, lastName, imageURL)
    }
}
