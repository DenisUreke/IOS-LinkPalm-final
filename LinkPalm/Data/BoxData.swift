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
    
    var boxDesign: (background: BackgroundData , text: TitleCustomModel , sfSymbol: SFSymbolData, imageVideoData: ImageVideoData ) = (BackgroundData(), TitleCustomModel(), SFSymbolData(), ImageVideoData())
    
    var imageVideoListData: ImageVideoDataList = ImageVideoDataList()
    
}

extension BoxData{
    
    func fillBoxDesign(){
        
        self.boxDesign.background.createBackgroundData()
        self.boxDesign.text.createNewTextBox(isTitle: true)
        self.boxDesign.sfSymbol.createSFSymbolData()
    }
    
    func fillBoxDesignImageOnly(imageURL: String){
        self.imageVideoListData.backgroundData.imageData.imageURL = URL(string: imageURL)!
        self.imageVideoListData.backgroundData.imageData.createDesignImage()
        self.imageVideoListData.backgroundData.imageData.selectedScale = 2
    }
    
    func populateContentInBoxesImage(){
        
        self.imageVideoListData.createNewTitleForList()
        self.imageVideoListData.createNewImageForList()
        self.imageVideoListData.createNewTextForList()
    }
    
    func populateContentInBoxesVideo(){
        
        self.imageVideoListData.createNewTitleForList()
        self.imageVideoListData.createNewVideoForList()
        self.imageVideoListData.createNewTextForList()
    }
}
