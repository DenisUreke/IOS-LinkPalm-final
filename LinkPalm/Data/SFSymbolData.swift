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

class SFSymbolModel{
    
    var data : SFSymbolData
    
    init(data: SFSymbolData = SFSymbolData()){
        self.data = data
    }
    
    func createSFSymbolData(){
        
        self.data.sfIcon = randomSFSymbol()
        self.data.selectedSize = generateNumber(50, 200)
        self.data.selectedColorFont = randomStandardColor()
        self.data.selectedFontOpacity = generateNumber(0.1, 1.0)
        self.data.selectedXOffsetIcon = generateNumber(-50, 50)
    }
}

