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
    
    @Attribute(.unique) let userID = UUID().uuidString
    var isEditMode = true
    
    var boxOne = BoxData()
    var wideBarOne = WideBarData()
    var firstName = "John"
    var lastName = "Doe"
    var typeOfContact = "person"
    
    init(userID: String = UUID().uuidString, isEditMode: Bool = true, boxOne: BoxData = BoxData(), wideBarOne: WideBarData = WideBarData()) {
    }
    
}

@Observable
class UserDesignList{
    
    var userList: [UserDesignModel] = [UserDesignModel()]
    
}
