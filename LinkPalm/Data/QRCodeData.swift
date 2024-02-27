//
//  QRCodeData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-15.
//

import Foundation
import Observation
import SwiftData

//@Observable
@Model
final class QRCodeData: Identifiable{
    
    var internalID: String
    let dateOfExchange: Date
    let firstName: String
    let lastName: String
    var typeOfContact: String = "person"
    
    init(component: [String]) {
        self.internalID = component[0]
        self.firstName = component[1]
        self.lastName = component[2]
        self.typeOfContact = component[3]
        self.dateOfExchange = Date()
    }
    

    init(internalID: String, firstName: String, lastName: String, typeOfContact: String, dateOfExchange: Date = Date()) {
        self.internalID = internalID
        self.firstName = firstName
        self.lastName = lastName
        self.typeOfContact = typeOfContact
        self.dateOfExchange = dateOfExchange
    }
}
