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

enum MenuEnum: String, CaseIterable, Codable, Hashable, MenuButtonRepresentable{
    
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
    var displayName: String {
        return self.rawValue
    }
}

enum MainMenuEnum: String, CaseIterable, Codable, Hashable, MenuButtonRepresentable{
    
    case person = "Contacts"
    case share = "Exchange"
    case yourProfile = "Profile"
    
    var sfSymbol : String{
        switch self{
        case .person:
            return "person.3"
        case .share:
            return "iphone.gen1.radiowaves.left.and.right"
        case .yourProfile:
            return "square.and.pencil"
        }
    }
    var displayName: String {
        return self.rawValue
    }
}

enum ShareContactEnum: String, CaseIterable, Codable, Hashable, MenuButtonRepresentable{
    
    case create = "Create QR"
    case read = "Read QR"
    case peer = "Connect"
    
    var sfSymbol : String{
        switch self{
        case .create:
            return "qrcode"
        case .read:
            return "qrcode.viewfinder"
        case.peer:
            return "iphone.gen1.radiowaves.left.and.right"
        }
    }
    
    var displayName: String {
        return self.rawValue
    }
}
