//
//  BoxData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import Foundation
import Observation
import SwiftData

@Observable
//@Model
class BoxData{
    
    var boxDesign: (background: BackgroundData, text: TitleCustomModel, sfSymbol: SFSymbolData, imageVideoData: ImageVideoData)
    
    var imageVideoListData: ImageVideoDataList
    
    init(boxDesign: (background: BackgroundData, text: TitleCustomModel, sfSymbol: SFSymbolData, imageVideoData: ImageVideoData) = (BackgroundData(), TitleCustomModel(), SFSymbolData(), ImageVideoData()),
         imageVideoListData: ImageVideoDataList = ImageVideoDataList()) {
        
        self.boxDesign = boxDesign
        self.imageVideoListData = imageVideoListData
    }
    
}

extension BoxData{
    
    func fillBoxDesign(){
        
        self.boxDesign.background.createBackgroundData()
        self.boxDesign.text.createNewTextBox(isTitle: true)
        self.boxDesign.sfSymbol.createSFSymbolData()
    }
    
    func fillBoxDesignImageOnly(imageURL: String){
        print("THE URL  \(imageURL)")
        self.boxDesign.imageVideoData.imageData.imageURL = URL(string: imageURL)!
        self.boxDesign.imageVideoData.imageData.createDesignImage()
        self.boxDesign.imageVideoData.imageData.selectedScale = 1
        self.boxDesign.background.createBackgroundData()
    }
    
    func populateContentInBoxesImage(meme: URL){
        
        self.imageVideoListData.createNewTitleForList()
        self.imageVideoListData.createNewImageForList(meme: meme)
        self.imageVideoListData.createNewTextForList()
    }
    
    func populateContentInBoxesVideo(){
        
        self.imageVideoListData.createNewTitleForList()
        self.imageVideoListData.createNewVideoForList()
        self.imageVideoListData.createNewTextForList()
    }
}
