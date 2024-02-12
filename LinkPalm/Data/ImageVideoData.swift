//
//  ImageVideoListData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import Foundation
import Observation
import SwiftUI

@Observable
class ImageVideoData: Identifiable{
    
    let id = UUID().uuidString
    var webAddress: String = ""
    var image: ImageData = ImageData()
    var typeOfBox: ImageVideoEnum = ImageVideoEnum.none
    var titleDCustomModel: TitleCustomModel = TitleCustomModel()
    var textCustomModel: TitleCustomModel = TitleCustomModel()
}

@Observable
class ImageVideoDataList{
    
    var entryCount: Int = 1
    var listOfEntries: [ImageVideoData] = [ImageVideoData()]
    
}
