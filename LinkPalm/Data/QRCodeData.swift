//
//  QRCodeData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-15.
//

import Foundation
import Observation

enum TypeOfContact {
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

@Observable
class QRCodeData: Identifiable{
    
    var ID: String
    var internalID = UUID().uuidString
    let dateOfExchange: Date = Date()
    var firstName: String
    var lastName: String
    var typeOfContact: TypeOfContact = .none
    
    init(ID: String = "1234", firstName: String = "First", lastName: String = "Second", typeOfContact: String = "person") {
        self.ID = ID
        self.firstName = firstName
        self.lastName = lastName
        self.typeOfContact = TypeOfContact(fromString: typeOfContact)
    }
    
    
}

@Observable
class QRCodeModel{
    
    var listOfContacts : [QRCodeData] = [QRCodeData()]
    
    func createContactAndAppend(components: [String]){
        
        if !listOfContacts.contains(where: { $0.ID == components[0] }) {
            self.listOfContacts.append(QRCodeData(ID: components[0], firstName: components[1], lastName: components[2], typeOfContact: components[3]))
        } else {
            print("Contact already exists")
        }
        
    }
    
}
