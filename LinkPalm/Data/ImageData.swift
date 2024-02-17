//
//  ImageData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import Foundation
import SwiftUI
import Observation

@Observable
class ImageData{
    
    var imageURL: URL?
    var selectedBackgroundImage: Image?
    var selectedContrast: Double = 1
    var selectedSaturation: Double = 1
    var selectedOpacity: Double = 1
    var selectedRotation: Double = 0
    var selectedHueRotation: Double = 0
    var selectedCornerRadius: Double = 0
    var selectedScale: Double = 1
    var selectedXAxisOffset: Double = 0
    var selectedYAxisOffset: Double = 0
    
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
