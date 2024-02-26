//
//  ImageModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-25.
//

import Foundation
import Observation

@Observable
class ImageModel{
    
    var data = ImageData()
    
    func resetValues(){
        self.data.imageURL = nil
        self.data.selectedBackgroundImage = nil
        self.data.isURL = false
        self.data.isURL = false
        self.data.isSaved = false
        self.data.isDeletable = false
    }
    
    func createImage(meme: URL){
        let random = Int(generateNumber(0, 1))
        
        self.data.imageURL = random == 1 ? URL(string:"https://picsum.photos/300/300.jpg")! : meme
        self.createDesignImage()
    }
    
    func createDesignImage(){
        
        self.data.selectedContrast = 1
        self.data.selectedSaturation = 1
        self.data.selectedOpacity = 1
        self.data.selectedRotation = 0
        self.data.selectedHueRotation = 0
        self.data.selectedCornerRadius = generateNumber(0, 50)
        self.data.selectedScale = generateNumber(0.5, 3.0)
        self.data.selectedXAxisOffset = 0
        self.data.selectedYAxisOffset = 0
        self.data.scaledToFill = Bool.random()
    }
}
