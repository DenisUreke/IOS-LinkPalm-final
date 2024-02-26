//
//  ImageData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import Foundation
import SwiftUI
import Observation
import SwiftData

//@Model
@Observable
class ImageData{
    
    let id = UUID().uuidString
    var imageURL: URL?
    var selectedBackgroundImage: Image?
    var selectedContrast: Double
    var selectedSaturation: Double
    var selectedOpacity: Double
    var selectedRotation: Double
    var selectedHueRotation: Double
    var selectedCornerRadius: Double
    var selectedScale: Double
    var selectedXAxisOffset: Double
    var selectedYAxisOffset: Double
    var scaledToFill: Bool
    var isURL: Bool
    var isDevice: Bool
    var isSaved: Bool
    var isDeletable: Bool
    
    init(imageURL: URL? = nil,
         selectedBackgroundImage: Image? = nil,
         selectedContrast: Double = 1,
         selectedSaturation: Double = 1,
         selectedOpacity: Double = 1,
         selectedRotation: Double = 0,
         selectedHueRotation: Double = 0,
         selectedCornerRadius: Double = 0,
         selectedScale: Double = 1,
         selectedXAxisOffset: Double = 0,
         selectedYAxisOffset: Double = 0,
         scaledToFill: Bool = false,
         isURL: Bool = false,
         isDevice: Bool = false,
         isSaved: Bool = false,
         isDeletable: Bool = false) {
        
        self.imageURL = imageURL
        self.selectedBackgroundImage = selectedBackgroundImage
        self.selectedContrast = selectedContrast
        self.selectedSaturation = selectedSaturation
        self.selectedOpacity = selectedOpacity
        self.selectedRotation = selectedRotation
        self.selectedHueRotation = selectedHueRotation
        self.selectedCornerRadius = selectedCornerRadius
        self.selectedScale = selectedScale
        self.selectedXAxisOffset = selectedXAxisOffset
        self.selectedYAxisOffset = selectedYAxisOffset
        self.scaledToFill = scaledToFill
        self.isURL = isURL
        self.isDevice = isDevice
        self.isSaved = isSaved
        self.isDeletable = isDeletable
    }
}
