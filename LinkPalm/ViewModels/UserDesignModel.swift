//
//  UserDesignModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import Foundation
import Observation
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
    var firstName : String
    var lastName : String
    var typeOfContact : String
    
    init(userID: String = "1234", firstName: String = "John", lastName: String = "Doe", typeOfContact: String = "person") {
        
        self.userID = userID
        self.firstName = firstName
        self.lastName = lastName
        self.typeOfContact = typeOfContact
    }
    
}

@Observable
class UserDesignList{
    
    var userList: [UserDesignModel] = [UserDesignModel(), UserDesignModel(firstName: "Rick", lastName: "Morty")]
    
    func createAndPopulateUserDesign(){
        
        var newUser: UserDesignModel = UserDesignModel()
        
    }
    
    
    
}
