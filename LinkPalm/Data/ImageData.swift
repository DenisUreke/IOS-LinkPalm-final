//
//  ImageData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import Foundation
import SwiftUI
import Observation

@Observable
class ImageData{
    
    var selectedBackgroundImage: Image?
    var selectedContrast: Double = 1
    var selectedSaturation: Double = 1
    var selectedOpacity: Double = 1
    var scaledToFill: Bool = false
}
