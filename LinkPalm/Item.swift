//
//  Item.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-07.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
