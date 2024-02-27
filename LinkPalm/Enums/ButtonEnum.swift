//
//  ButtonEnum.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-24.
//

import Foundation

protocol MenuButtonRepresentable {
    var sfSymbol: String { get }
    var displayName: String { get }
}

enum ButtonEnum: String, MenuButtonRepresentable {
    case share = "share"
    case add = "Add"
    case ok = "OK"
    case item = "item"
    case person = "person"
    case company = "company"

    var sfSymbol: String {
        switch self {
        case .share: return "shareplay"
        case .add: return "plus.square"
        case .ok: return "multiply.square"
        case .person: return "person.crop.square"
        case .item: return "tag.square"
        case .company: return "star.square"

        }
    }
    var displayName: String {
        return self.rawValue
    }
}
