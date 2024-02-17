//
//  TitleCustomModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import Foundation
import Observation

@Observable
class TitleCustomModel{
    
    var text: String = "Your Text"
    var selectedSize: Double = 24
    var selectedStyle: FontStyle = .defaults
    var selectedWeight: FontWeight = .regularWeight
    var selectedColorBackground: StandardColors = .clear
    var selectedColorBackgroundTwo: StandardColors = .clear
    var selectedColorFont: StandardColors = .black
    var selectedOpacity: Double = 1
    var gradientIsClicked = false
    var shadowIsClicked = false
    var selectedBackgroundOpacity: Double = 1
    var selectedFontOpacity: Double = 1
    var selectedAlignment: FontAlignment = .alignmentCenter
    var selectedTextAlignment: FontTextAlignment = .TextAlignmentLeft
    var selectedBorderColor: StandardColors = .black
    var selectedBorderWidth: Double = 0
    var selectedCornerRadius: Double = 0
    var selectedImageCornerRadius: Double = 0
    var selectedXOffsetText: Double = 0
    
    let sizeOptions: [FontSize] = [.title1, .title2, .title3]
    let styleOptions: [FontStyle] = [.defaults, .monoSpaced, .serif]
    let weightOptions: [FontWeight] = [.regularWeight, .semiBoldWeight, .boldWeight]
    let alignmentOptions: [FontAlignment] = [.alignmentCenter, .alignmentLeft, .alignmentRight]
    let textAlignmentOptions: [FontTextAlignment] = [.TextAlignmentLeft, .TextAlignmentCenter, .TextAlignmentRight]
    
}

extension TitleCustomModel{
    
    func CreateTitle(){
        
        self.text = generatePlaceholderText(wordCount: generateNumber(1, 5))
        self.selectedSize = generateNumber(26, 50)
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
        self.selectedAlignment = .alignmentCenter
        self.selectedTextAlignment = .TextAlignmentLeft
        self.selectedBorderColor = randomStandardColor()
        self.selectedBorderWidth = generateNumber(0, 25)
        self.selectedCornerRadius = generateNumber(0, 25)
        self.selectedImageCornerRadius = generateNumber(0, 25)
        self.selectedXOffsetText = 10
        
    }
}
