//
//  ImageConfigEnums.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import Foundation
import SwiftUI

enum EditImageString: String, Codable, Hashable{
    
    case saturation = "Saturation"
    case contrast = "Contrast"
    case opacity = "Opacity"
    case rotation = "Rotation"
    case hueRotation = "Hue Rotation"
    case cornerRadius = "Border corner radius"
    case imageCornerRadius = "Image corner radius"
    case fontSize = "Size"
    case xOffset = "Text Y-axis"
    case xOffsetIcon = "Icon Y-axis"
    case imageScale = "Scale Image"
    case yOffsetImage = "Image Y-axis"
    case xOffsetImage = "Image X-axis"
}

enum PhotoPickerChoice: Identifiable, Codable, Hashable{
    
    case nothingClicked
    case ImageClicked
    case DeviceClicked
    case URLclicked
    case saveClicked
    
    var id: Self { self }
}
