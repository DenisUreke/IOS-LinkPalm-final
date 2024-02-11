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
    var sfIcon: SFSymbolEnum = .camera
    var webAddress: String = ""
    var iconSize: Double = 24
    var iconColor: StandardColors = .black
    var iconOpacity: Double = 1
    var backgroundColor: StandardColors = .green
    var backgroundColorTwo: StandardColors = .clear
    var backgroundOpacity: Double = 1
    var gradientIsClicked: Bool = false
    //var url : URL
}

@Observable
class WideBarListData: Identifiable{
    
    var buttonCount: Int = 1
    
        var listOfIcons: [WideBarListDataicons] = [
            WideBarListDataicons()
        ]
    
    func addNewButtonToWideList(){
        
        if buttonCount < 8 {
            listOfIcons.append(WideBarListDataicons())
            buttonCount += 1
        }
    }
    
    func removeButtonFromWideList(){
        if buttonCount > 1{ listOfIcons.removeLast()
            buttonCount -= 1
        }
    }
    
}
