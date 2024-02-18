//
//  WideBarData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-11.
//

import Foundation
import Observation
import SwiftData


@Observable
//@Model
class WideBarData{
    
    var wideBarListData = WideBarListData()
    
    init(wideBarListData: WideBarListData = WideBarListData()){
        self.wideBarListData = wideBarListData
    }
}
