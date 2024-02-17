//
//  BackgroundDesignData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import SwiftUI
import Foundation
import Observation


@Observable
class BackgroundData {

    var gradientIsClicked = false
    var selectedBackgroundOpacity: Double = 1
    var selectedColorBackgroundOne: StandardColors = .clear
    var selectedColorBackgroundTwo: StandardColors = .clear
    var selectedBorderColor: StandardColors = .black
    var selectedBorderWidth: Double = 0
    var imageData = ImageData()
    var selectedCornerRadius: Double = 0
    
}

extension BackgroundData {
    
    func createBackgroundData(){
        self.gradientIsClicked = Bool.random()
        self.selectedBackgroundOpacity = generateNumber(0.5, 1.0)
        self.selectedColorBackgroundOne = randomStandardColor()
        self.selectedColorBackgroundTwo = randomStandardColor()
        self.selectedBorderColor = randomStandardColor()
        self.selectedBorderWidth = generateNumber(0, 20)
        self.selectedCornerRadius = generateNumber(0, 40)
    }
}
