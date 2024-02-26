//
//  TitleCustomModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-25.
//

import Foundation
import Observation

@Observable
class TitleCustomModel{
    
    var data : TitleCustomData
    
    init(data : TitleCustomData = TitleCustomData())
    {
        self.data = data
    }
    
    func createNewTextBox(isTitle: Bool){
        
        isTitle ? self.CreateTitle() : self.CreateText()
        self.createCustomDesignText()
    }
    
    func CreateTitle(){
        
        self.data.text = generatePlaceholderText(wordCount: generateNumber(1, 5))
        self.data.selectedSize = generateNumber(26, 50)
    }
    
    func CreateText(){
        
        self.data.text = generatePlaceholderText(wordCount: generateNumber(100, 200))
        self.data.selectedSize = generateNumber(16, 24)
        self.data.selectedAlignment = randomAlignment()
        self.data.selectedTextAlignment = randomTextAlignment()
        self.data.selectedColorBackground = randomStandardColor()
    }
    
    func createCustomDesignText(){
        
        self.data.selectedStyle = randomFontStyle()
        self.data.selectedWeight = randomWeight()
        self.data.selectedColorBackground = randomStandardColor()
        self.data.selectedColorBackgroundTwo = randomStandardColor()
        self.data.selectedColorFont = randomStandardColor()
        self.data.selectedOpacity = generateNumber(0.5, 1.0)
        self.data.gradientIsClicked = Bool.random()
        self.data.shadowIsClicked = Bool.random()
        self.data.selectedBackgroundOpacity = generateNumber(0.1, 1.0)
        self.data.selectedFontOpacity = generateNumber(0.5, 1.0)
        self.data.selectedBorderColor = randomStandardColor()
        self.data.selectedBorderWidth = generateNumber(0, 25)
        self.data.selectedCornerRadius = generateNumber(0, 25)
        self.data.selectedImageCornerRadius = generateNumber(0, 25)
        self.data.selectedXOffsetText = 10
    }
}
