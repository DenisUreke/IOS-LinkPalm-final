//
//  sfSymbolData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-16.
//

import Foundation
import Observation
import SwiftData

@Observable
//@Model
class SFSymbolData{
    
    var sfIcon: SFSymbolEnum
    var selectedSize: Double
    var selectedColorFont: StandardColors
    var selectedFontOpacity: Double
    var selectedXOffsetIcon: Double

    init(sfIcon: SFSymbolEnum = .none,
         selectedSize: Double = 24,
         selectedColorFont: StandardColors = .black,
         selectedFontOpacity: Double = 1,
         selectedXOffsetIcon: Double = 0) {
        
        self.sfIcon = sfIcon
        self.selectedSize = selectedSize
        self.selectedColorFont = selectedColorFont
        self.selectedFontOpacity = selectedFontOpacity
        self.selectedXOffsetIcon = selectedXOffsetIcon
    }
    
}

extension SFSymbolData{
    
    func createSFSymbolData(){
        
        self.sfIcon = randomSFSymbol()
        self.selectedSize = generateNumber(50, 200)
        self.selectedColorFont = randomStandardColor()
        self.selectedFontOpacity = generateNumber(0.1, 1.0)
        self.selectedXOffsetIcon = generateNumber(-50, 50)
    }
    
}
