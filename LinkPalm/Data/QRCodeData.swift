//
//  QRCodeData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-15.
//

import Foundation
import Observation
import SwiftData

enum TypeOfContact: Codable, Hashable {
    case person, item, company, none

    init(fromString string: String) {
        switch string {
        case "person":
            self = .person
        case "item":
            self = .item
        case "company":
            self = .company
        default:
            self = .none
        }
    }
    var asString: String{
        switch self{
        case .company:
            return "company"
        case .item:
            return "item"
        case .person:
            return "person"
        case .none:
            return "none"
            
        }
    }
}

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

@Observable
class QRCodeModel{
    
    var listOfContacts: [QRCodeData]
    
    init(listOfContacts: [QRCodeData] = []) {
        self.listOfContacts = listOfContacts
    }
    
    /*func createContactAndAppend(components: [String]){
        
        if !listOfContacts.contains(where: { $0.internalID == components[0] }) {
            self.listOfContacts.append(QRCodeData(internalID: components[0], typeOfContact: components[1]))
        } else {
            print("Contact already exists")
        }
        
    }*/
    
}
