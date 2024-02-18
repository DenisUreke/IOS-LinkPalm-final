//
//  TitleCustomModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import Foundation
import Observation
import SwiftData

@Observable
//@Model
class TitleCustomModel{
    
    let id = UUID().uuidString
    var text: String
    var selectedSize: Double
    var selectedStyle: FontStyle
    var selectedWeight: FontWeight
    var selectedColorBackground: StandardColors
    var selectedColorBackgroundTwo: StandardColors
    var selectedColorFont: StandardColors
    var selectedOpacity: Double
    var gradientIsClicked: Bool
    var shadowIsClicked: Bool
    var selectedBackgroundOpacity: Double
    var selectedFontOpacity: Double
    var selectedAlignment: FontAlignment
    var selectedTextAlignment: FontTextAlignment
    var selectedBorderColor: StandardColors
    var selectedBorderWidth: Double
    var selectedCornerRadius: Double
    var selectedImageCornerRadius: Double
    var selectedXOffsetText: Double

    let sizeOptions = [FontSize.title1, .title2, .title3]
    let styleOptions = [FontStyle.defaults, .monoSpaced, .serif]
    let weightOptions = [FontWeight.regularWeight, .semiBoldWeight, .boldWeight]
    let alignmentOptions = [FontAlignment.alignmentCenter, .alignmentLeft, .alignmentRight]
    let textAlignmentOptions = [FontTextAlignment.TextAlignmentLeft, .TextAlignmentCenter, .TextAlignmentRight]

    init(text: String = "",
         selectedSize: Double = 24,
         selectedStyle: FontStyle = .defaults,
         selectedWeight: FontWeight = .regularWeight,
         selectedColorBackground: StandardColors = .clear,
         selectedColorBackgroundTwo: StandardColors = .clear,
         selectedColorFont: StandardColors = .black,
         selectedOpacity: Double = 1,
         gradientIsClicked: Bool = false,
         shadowIsClicked: Bool = false,
         selectedBackgroundOpacity: Double = 1,
         selectedFontOpacity: Double = 1,
         selectedAlignment: FontAlignment = .alignmentCenter,
         selectedTextAlignment: FontTextAlignment = .TextAlignmentLeft,
         selectedBorderColor: StandardColors = .black,
         selectedBorderWidth: Double = 0,
         selectedCornerRadius: Double = 0,
         selectedImageCornerRadius: Double = 8,
         selectedXOffsetText: Double = 0) {
        
        self.text = text
        self.selectedSize = selectedSize
        self.selectedStyle = selectedStyle
        self.selectedWeight = selectedWeight
        self.selectedColorBackground = selectedColorBackground
        self.selectedColorBackgroundTwo = selectedColorBackgroundTwo
        self.selectedColorFont = selectedColorFont
        self.selectedOpacity = selectedOpacity
        self.gradientIsClicked = gradientIsClicked
        self.shadowIsClicked = shadowIsClicked
        self.selectedBackgroundOpacity = selectedBackgroundOpacity
        self.selectedFontOpacity = selectedFontOpacity
        self.selectedAlignment = selectedAlignment
        self.selectedTextAlignment = selectedTextAlignment
        self.selectedBorderColor = selectedBorderColor
        self.selectedBorderWidth = selectedBorderWidth
        self.selectedCornerRadius = selectedCornerRadius
        self.selectedImageCornerRadius = selectedImageCornerRadius
        self.selectedXOffsetText = selectedXOffsetText
    }
    
}

extension TitleCustomModel{
    
    func createNewTextBox(isTitle: Bool){
        
        isTitle ? self.CreateTitle() : self.CreateText()
        self.createCustomDesignText()
    }
    
    func CreateTitle(){
        
        self.text = generatePlaceholderText(wordCount: generateNumber(1, 5))
        self.selectedSize = generateNumber(26, 50)
    }
    
    func CreateText(){
        
        self.text = generatePlaceholderText(wordCount: generateNumber(100, 200))
        self.selectedSize = generateNumber(16, 24)
        self.selectedAlignment = randomAlignment()
        self.selectedTextAlignment = randomTextAlignment()
    }
    
    func createCustomDesignText(){
        
        self.selectedStyle = randomFontStyle()
        self.selectedWeight = randomWeight()
        self.selectedColorBackground = randomStandardColor()
        self.selectedColorBackgroundTwo = randomStandardColor()
        self.selectedColorFont = randomStandardColor()
        self.selectedOpacity = generateNumber(0.5, 1.0)
        self.gradientIsClicked = Bool.random()
        self.shadowIsClicked = Bool.random()
        self.selectedBackgroundOpacity = generateNumber(0.1, 1.0)
        self.selectedFontOpacity = generateNumber(0.5, 1.0)
        self.selectedBorderColor = randomStandardColor()
        self.selectedBorderWidth = generateNumber(0, 25)
        self.selectedCornerRadius = generateNumber(0, 25)
        self.selectedImageCornerRadius = generateNumber(0, 25)
        self.selectedXOffsetText = 10
    }
    
}
