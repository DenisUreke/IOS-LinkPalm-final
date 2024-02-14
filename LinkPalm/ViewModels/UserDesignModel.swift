//
//  UserDesignModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import Foundation
import Observation


@Observable
class UserDesignModel{
    
    var userID = UUID().uuidString
    var isEditMode = true
    
    var boxOne = BoxData()
    var wideBarOne = WideBarData()
    
}
