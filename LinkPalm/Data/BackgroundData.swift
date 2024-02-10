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
    
}