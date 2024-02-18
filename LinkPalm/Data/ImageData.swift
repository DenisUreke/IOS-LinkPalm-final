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
         selectedYAxisOffset: Double = 0) {
        
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
    }
    
}

extension ImageData{
    
    func createImage(meme: URL){
        let random = Int(generateNumber(0, 1))
        
        self.imageURL = random == 1 ? URL(string:"https://picsum.photos/300/300.jpg")! : meme
        self.createDesignImage()
    }
    
    func createDesignImage(){
        
        self.selectedContrast = 1
        self.selectedSaturation = 1
        self.selectedOpacity = 1
        self.selectedRotation = 0
        self.selectedHueRotation = 0
        self.selectedCornerRadius = generateNumber(0, 50)
        self.selectedScale = generateNumber(0.5, 3.0)
        self.selectedXAxisOffset = 0
        self.selectedYAxisOffset = 0
    }
    
}
