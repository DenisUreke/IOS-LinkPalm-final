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
    
    var imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/bf/Bulldog_inglese.jpg")!
    var selectedBackgroundImage: Image?
    var selectedContrast: Double = 1
    var selectedSaturation: Double = 1
    var selectedOpacity: Double = 1
    var selectedRotation: Double = 0
    var selectedHueRotation: Double = 0
}
