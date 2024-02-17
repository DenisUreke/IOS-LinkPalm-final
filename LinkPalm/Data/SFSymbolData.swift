//
//  sfSymbolData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-16.
//

import Foundation
import Observation

@Observable
class SFSymbolData{
    
    var sfIcon: SFSymbolEnum = .none
    var selectedSize: Double = 24
    var selectedColorFont: StandardColors = .black
    var selectedFontOpacity: Double = 1
    var selectedXOffsetIcon: Double = 0
    
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
