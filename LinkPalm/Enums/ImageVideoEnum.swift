//
//  ImageVideoEnums.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import Foundation

enum ImageVideoEnum: String, CaseIterable, Codable, Hashable{
    case none = "A"
    case video = "B"
    case picture = "C"
    case picturefromweb = "D"
    case text = "E"
}
