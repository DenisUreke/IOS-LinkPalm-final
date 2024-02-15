//
//  WideBarListModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import Foundation
import Observation
import SwiftUI

@Observable
class WideBarListDataicons: Identifiable{
    
    let id = UUID().uuidString
    var sfIcon: SFSymbolEnum = .house
    var isWebLink: Bool = false
    var isVideoLink: Bool = false
    var webAddress: String = ""
    var iconSize: Double = 24
    var iconColor: StandardColors = .black
    var iconOpacity: Double = 1
    var backgroundColor: StandardColors = .green
    var backgroundColorTwo: StandardColors = .clear
    var backgroundOpacity: Double = 1
    var gradientIsClicked: Bool = false
    var text: String = ""
    
    var selectedSize: Double = 24
    var selectedStyle: FontStyle = .defaults
    var selectedWeight: FontWeight = .regularWeight
    var selectedColorBackground: StandardColors = .clear
    var selectedColorBackgroundTwo: StandardColors = .clear
    var selectedColorFont: StandardColors = .black
    var selectedOpacity: Double = 1
    var shadowIsClicked = false
    var selectedFontOpacity: Double = 1
    var selectedAlignment: FontAlignment = .alignmentCenter
    var selectedTextAlignment: FontTextAlignment = .TextAlignmentLeft
    
    let sizeOptions: [FontSize] = [.title1, .title2, .title3]
    let styleOptions: [FontStyle] = [.defaults, .monoSpaced, .serif]
    let weightOptions: [FontWeight] = [.regularWeight, .semiBoldWeight, .boldWeight]
    let alignmentOptions: [FontAlignment] = [.alignmentCenter, .alignmentLeft, .alignmentRight]
    let textAlignmentOptions: [FontTextAlignment] = [.TextAlignmentLeft, .TextAlignmentCenter, .TextAlignmentRight]

    init(copying icon: WideBarListDataicons) {
        
        self.sfIcon = icon.sfIcon
        self.isWebLink = false
        self.webAddress = ""
        self.iconSize = icon.iconSize
        self.iconColor = icon.iconColor
        self.iconOpacity = icon.iconOpacity
        self.backgroundColor = icon.backgroundColor
        self.backgroundColorTwo = icon.backgroundColorTwo
        self.backgroundOpacity = icon.backgroundOpacity
        self.gradientIsClicked = icon.gradientIsClicked
        self.text = icon.text
        
        self.selectedSize = icon.selectedSize
        self.selectedStyle = icon.selectedStyle
        self.selectedWeight = icon.selectedWeight
        self.selectedColorBackground = icon.selectedColorBackground
        self.selectedColorBackgroundTwo = icon.selectedColorBackgroundTwo
        self.selectedColorFont = icon.selectedColorFont
        self.selectedOpacity = icon.selectedOpacity
        self.shadowIsClicked = icon.shadowIsClicked
        self.selectedFontOpacity = icon.selectedFontOpacity
        self.selectedAlignment = icon.selectedAlignment
        self.selectedTextAlignment = icon.selectedTextAlignment
    }

    init() { }
}

@Observable
class WideBarListData: Identifiable{
    
    var buttonCount: Int = 1
    
        var listOfIcons: [WideBarListDataicons] = [WideBarListDataicons()]
    
    func addNewButtonToWideList(){
        
        if buttonCount < 8, let lastButton = listOfIcons.last {
            let newButton = WideBarListDataicons(copying: lastButton)
            listOfIcons.append(newButton)
            buttonCount += 1
        }
    }
    
    func removeButtonFromWideList(){
        if buttonCount > 1{ listOfIcons.removeLast()
            buttonCount -= 1
        }
    }
    
    func resetAdressValues(){
        self.listOfIcons.last!.isWebLink = false
        self.listOfIcons.last!.isVideoLink = false
        self.listOfIcons.last!.webAddress = ""
    }
    
    func checkIfLinkExists() -> Bool{
        return self.listOfIcons.last!.isWebLink || self.listOfIcons.last!.isVideoLink
    }
    
}
