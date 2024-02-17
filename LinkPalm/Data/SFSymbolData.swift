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
    
    var sfIcon: SFSymbolEnum = .house
    var selectedSize: Double = 24
    var selectedColorFont: StandardColors = .black
    var selectedFontOpacity: Double = 1
    var selectedXOffsetIcon: Double = 0
    
}

extension SFSymbolData{
    
    /*func createSFSymbolData(){
        
        self.sfIcon = randomSFSymbol()
        self.selectedSize =
        self.selectedColorFont =
        self.selectedFontOpacity =
        self.selectedXOffsetIcon =
    }*/
    
}
