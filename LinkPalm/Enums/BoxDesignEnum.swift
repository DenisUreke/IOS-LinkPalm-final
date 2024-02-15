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

enum MainMenuEnum: String, CaseIterable{
    
    case person = "Contacts"
    case share = "Share Contact"
    case yourProfile = "Your Profile"
    
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
}

enum ShareContactEnum: String, CaseIterable{
    
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
}
