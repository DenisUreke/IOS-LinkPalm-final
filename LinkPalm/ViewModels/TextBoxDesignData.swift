//
//  UserDesignModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-09.
//

import Foundation
import Observation


@Observable
class TextBoxDesignData{
    
    var TextBoxDesign = (title: TitleCustomModel(), text: TitleCustomModel())
    var TextBackgroundDesign = BackgroundData()
}
