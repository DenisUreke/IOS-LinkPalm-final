//
//  SmallerFunctions.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-17.
//

import SwiftUI
import Foundation

func generateNumber(_ min: Double,_ max: Double) -> Double {
    return Double.random(in: min...max)
}
func returnRandomColor()-> Color{
    return StandardColors.allCases.randomElement()?.color ?? Color.black
}
func randomFontStyle() -> FontStyle {
    return FontStyle.allCases.randomElement() ?? .defaults
}

func randomWeight() -> FontWeight {
    return FontWeight.allCases.randomElement() ?? .regularWeight
}
func randomStandardColor() -> StandardColors {
    return StandardColors.allCases.randomElement() ?? .black
}
func randomSFSymbol() -> SFSymbolEnum {
    return SFSymbolEnum.allCases.randomElement() ?? .heart
}
func randomAlignment() -> FontAlignment {
    return FontAlignment.allCases.randomElement() ?? .alignmentCenter
}
func randomTextAlignment() -> FontTextAlignment {
    return FontTextAlignment.allCases.randomElement() ?? .TextAlignmentLeft
}
