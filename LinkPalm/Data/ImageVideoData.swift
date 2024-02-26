//
//  ImageVideoListData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import Foundation
import Observation
import SwiftUI
import SwiftData

@Observable
//@Model
class ImageVideoData: Identifiable{
    
    let id = UUID().uuidString
    var videoID: URL
    var webAdress: String
    var imageData: ImageModel
    var typeOfBox: ImageVideoEnum // Decides what View to be called from the list writer
    var textCustomModel: TitleCustomModel
    
    init(videoID: URL = URL(string: "https://www.youtube.com/watch?v=3uEbkUmS29A")!,
         webAdress: String = "",
         imageData: ImageModel = ImageModel(),
         typeOfBox: ImageVideoEnum = .none,
         textCustomModel: TitleCustomModel = TitleCustomModel()) {
        self.videoID = videoID
        self.webAdress = webAdress
        self.imageData = imageData
        self.typeOfBox = typeOfBox
        self.textCustomModel = textCustomModel
    }
    
    func setTypeOfBox(type: ImageVideoEnum){
        self.typeOfBox = type
    }
    
    func setImageUrlFromString(string: String) {
        if let url = URL(string: string) {
            self.imageData.data.imageURL = url
            self.typeOfBox = .picturefromweb
        } else {
            return
        }
    }
    
    func setImageFromDevice(){
        self.typeOfBox = .picture
    }
}

