//
//  BoxDesignEnum.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import Foundation

enum BoxDesignStatus{
    case notEditMode
    case editMode
    case currentlyEditing
}

enum MenuEnum: String, CaseIterable{
    
    case text = "Text"
    case image = "Image"
    case video = "Video"
    case background = "Edit Background"
    
    var sfSymbol : String {
        switch self{
        case .text:
            return "doc.plaintext"
        case .image:
            return "photo"
        case .video:
            return  "play.rectangle"
        case .background:
            return "photo.on.rectangle"
        }
    }
    
}
