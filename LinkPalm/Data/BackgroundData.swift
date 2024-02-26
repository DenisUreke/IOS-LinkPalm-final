//
//  BackgroundDesignData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import SwiftUI
import Foundation
import Observation
import SwiftData


@Observable
//@Model
class BackgroundData {

    var gradientIsClicked: Bool
    var selectedBackgroundOpacity: Double
    var selectedColorBackgroundOne: StandardColors
    var selectedColorBackgroundTwo: StandardColors
    var selectedBorderColor: StandardColors
    var selectedBorderWidth: Double
    var imageData: ImageModel
    var selectedCornerRadius: Double
    
    init(gradientIsClicked: Bool = false,
         selectedBackgroundOpacity: Double = 1,
         selectedColorBackgroundOne: StandardColors = .gray,
         selectedColorBackgroundTwo: StandardColors = .clear,
         selectedBorderColor: StandardColors = .black,
         selectedBorderWidth: Double = 0,
         imageData: ImageModel = ImageModel(),
         selectedCornerRadius: Double = 8) {
        
        self.gradientIsClicked = gradientIsClicked
        self.selectedBackgroundOpacity = selectedBackgroundOpacity
        self.selectedColorBackgroundOne = selectedColorBackgroundOne
        self.selectedColorBackgroundTwo = selectedColorBackgroundTwo
        self.selectedBorderColor = selectedBorderColor
        self.selectedBorderWidth = selectedBorderWidth
        self.imageData = imageData
        self.selectedCornerRadius = selectedCornerRadius
    }
    
}
