//
//  BoxData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import Foundation
import Observation


@Observable
class BoxData{
    
    var boxDesign: (background: BackgroundData , text: TitleCustomModel) = (BackgroundData(), TitleCustomModel())
    var imageVideoListData: ImageVideoDataList = ImageVideoDataList()
}
