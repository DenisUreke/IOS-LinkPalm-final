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

    var sfSymbol: String {
        switch self {
        case .share: return "shareplay"
        case .add: return "plus.square"
        case .ok: return "multiply.square"

        }
    }
    var displayName: String {
        return self.rawValue
    }
}
