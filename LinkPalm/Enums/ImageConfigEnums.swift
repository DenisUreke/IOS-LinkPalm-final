//
//  ImageConfigEnums.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import Foundation
import SwiftUI

enum EditImageString: String{
    
    case saturation = "Saturation"
    case contrast = "Contrast"
    case opacity = "Opacity"
    
}

enum ViewPassedIntoPhotoSelector{
    
    case textView
    
}

func createView(enumIn: ViewPassedIntoPhotoSelector) -> UIView {
    switch enumIn {
    case .textView:
        let textView = UITextView()
        return textView
    }
}
