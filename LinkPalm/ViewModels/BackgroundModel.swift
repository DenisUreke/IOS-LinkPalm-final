//
//  BackgroundModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-25.
//

import Foundation
import Observation

@Observable
class BackGroundModel{
    
    var data : BackgroundData
    
    init(data : BackgroundData = BackgroundData())
    {
        self.data = data
    }
    
    func createBackgroundData(){
        self.data.gradientIsClicked = Bool.random()
        self.data.selectedBackgroundOpacity = generateNumber(0.5, 1.0)
        self.data.selectedColorBackgroundOne = randomStandardColor()
        self.data.selectedColorBackgroundTwo = randomStandardColor()
        self.data.selectedBorderColor = randomStandardColor()
        self.data.selectedBorderWidth = generateNumber(0, 20)
        self.data.selectedCornerRadius = generateNumber(0, 40)
    }
}

