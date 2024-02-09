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
    
    var title: String = "Title Here"
    var text: String = "Your Text"
    var selectedSize: Double = 24
    var selectedStyle: FontStyle = .defaults
    var selectedWeight: FontWeight = .regularWeight
    var selectedColorBackground: StandardColors = .clear
    var selectedColorFont: StandardColors = .black
    var selectedOpacity: Double = 1
    var gradientIsClicked = false
    var shadowIsClicked = false
    var selectedBackgroundOpacity: Double = 1
    var selectedFontOpacity: Double = 1
    var selectedAlignment: FontAlignment = .alignmentCenter
    
    var selectedBorderColor: StandardColors = .black
    var selectedBorderWidth: Double = 0
    
    let sizeOptions: [FontSize] = [.title1, .title2, .title3]
    let styleOptions: [FontStyle] = [.defaults, .monoSpaced, .serif]
    let weightOptions: [FontWeight] = [.regularWeight, .semiBoldWeight, .boldWeight]
    let alignmentOptions: [FontAlignment] = [.alignmentCenter, .alignmentLeft, .alignmentRight]
    
}
