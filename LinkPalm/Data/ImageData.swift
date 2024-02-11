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
    
    let sfSymbolOptions: [SFSymbolEnum] = [.house, .heart, .person, .clock, .bell, .envelope, .gear, .trash, .pencil, .bookmark, .camera, .message, .phone, .photo, .video, .map, .airplane, .car, .leaf, .moon, .sunMax, .drop, .flame, .cloud, .snow, .tornado, .tropicalStorm, .thermometer, .umbrella, .none]

}
