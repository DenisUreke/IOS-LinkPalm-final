//
//  ContainerEnums.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import Foundation
import SwiftUI

//---- Type of Container
enum TypeOfContainer: Codable, Hashable{
    
    case text
    case image
    case video
    case pdf
}

//---- Type of WideBar

enum TypeOfWideBar: Codable, Hashable{
    case normal
    case list
}

//---- Color for both fonts and background

enum StandardColors: CaseIterable, Codable, Hashable {
    case black, white, gray, red, green, blue
    case orange, yellow, pink, purple, teal
    case indigo, mint, brown, clear
    
    var color: Color {
        switch self {
        case .black:
            return Color.black
        case .white:
            return Color.white
        case .gray:
            return Color.gray
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .blue:
            return Color.blue
        case .orange:
            return Color.orange
        case .yellow:
            return Color.yellow
        case .pink:
            return Color.pink
        case .purple:
            return Color.purple
        case .teal:
            return Color.teal
        case .indigo:
            return Color.indigo
        case .mint:
            return Color.mint
        case .brown:
            return Color.brown
        case .clear:
            return Color.clear
        }
    }
}
