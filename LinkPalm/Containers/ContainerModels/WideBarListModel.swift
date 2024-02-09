//
//  WideBarListModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import Foundation
import Observation
import SwiftUI

struct WideBarListData: Identifiable{
    
    let id = UUID().uuidString
    var sfIcon : String
    var iconColor : Color = Color.black
    //var url : URL
}

@Observable
class WideBarListModel: ContainerSuperClass, Identifiable{
    
    var iconCount: Int = 0
    
        var listOfIcons: [WideBarListData] = [
            WideBarListData(sfIcon: "arrow.up"),
            WideBarListData(sfIcon: "arrow.down"),
            WideBarListData(sfIcon: "arrow.left"),
            WideBarListData(sfIcon: "arrow.right"),
            WideBarListData(sfIcon: "arrow.up"),
            WideBarListData(sfIcon: "arrow.down"),
            WideBarListData(sfIcon: "arrow.left"),
            WideBarListData(sfIcon: "arrow.right")
        ]
    
}
