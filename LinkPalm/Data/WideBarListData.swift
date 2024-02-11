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
    var webAddress: String = ""
    var iconSize: Double = 24
    var iconColor: StandardColors = .black
    var iconOpacity: Double = 1
    var backgroundColor: StandardColors = .green
    var backgroundColorTwo: StandardColors = .clear
    var backgroundOpacity: Double = 1
    var gradientIsClicked: Bool = false

    init(copying icon: WideBarListDataicons) {
        self.sfIcon = icon.sfIcon
        self.webAddress = icon.webAddress
        self.iconSize = icon.iconSize
        self.iconColor = icon.iconColor
        self.iconOpacity = icon.iconOpacity
        self.backgroundColor = icon.backgroundColor
        self.backgroundColorTwo = icon.backgroundColorTwo
        self.backgroundOpacity = icon.backgroundOpacity
        self.gradientIsClicked = icon.gradientIsClicked
    }

    init() { }
}

@Observable
class WideBarListData: Identifiable{
    
    var buttonCount: Int = 1
    
        var listOfIcons: [WideBarListDataicons] = [
            WideBarListDataicons()
        ]
    
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
    
}
