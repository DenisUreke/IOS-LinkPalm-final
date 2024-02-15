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
final class UserDesignModel{
    
    //@Attribute(.unique) let userID = UUID().uuidString
    let userID : String
    var isEditMode = true
    
    var boxOne = BoxData()
    var wideBarOne = WideBarData()
    var firstName : String
    var lastName : String
    var typeOfContact : String
    
    init(userID: String = "1234", isEditMode: Bool = true, firstName: String = "John", lastName: String = "Doe", typeOfContact: String = "person") {
        
        self.userID = userID
        self.isEditMode = isEditMode
        self.firstName = firstName
        self.lastName = lastName
        self.typeOfContact = typeOfContact
    }
    
}

@Observable
class UserDesignList{
    
    var userList: [UserDesignModel] = [UserDesignModel(), UserDesignModel(userID: "4321")]
    
}
