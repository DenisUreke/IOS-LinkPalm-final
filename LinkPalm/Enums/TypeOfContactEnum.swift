//
//  TypeOfContactEnum.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-23.
//

import Foundation

enum TypeOfContact: Codable, Hashable, CaseIterable {
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
    var asIcon: String{
        switch self{
        case .person:
            return "person.crop.square"
        case .company:
            return "star.square"
        case .item:
            return "tag.square"
        case .none:
            return "square.grid.3x3.square"
        }
    }
}

extension TypeOfContact {
    static func from(string: String) -> TypeOfContact {
        switch string {
        case "person":
            return .person
        case "item":
            return .item
        case "company":
            return .company
        default:
            return .none
        }
    }
}
