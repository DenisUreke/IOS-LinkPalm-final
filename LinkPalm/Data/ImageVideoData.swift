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
    var videoID: URL = URL(string: "https://www.youtube.com/watch?v=3uEbkUmS29A")!
    var webAdress: String = ""
    var imageData: ImageData = ImageData()
    var typeOfBox: ImageVideoEnum = ImageVideoEnum.none // Decides what View to be called from the list writer
    var textCustomModel: TitleCustomModel = TitleCustomModel()
    
    func setTypeOfBox(type: ImageVideoEnum){
        self.typeOfBox = type
    }
    
    func setImageUrlFromString(string: String) {
        if let url = URL(string: string) {
            self.imageData.imageURL = url
            self.typeOfBox = .picturefromweb
        } else {
            return
        }
    }
    
    func setVideoUrlFromString(string: String) {
        if let url = URL(string: string) {
            self.videoID = url
            self.typeOfBox = .video
        } else {
            return
        }
    }
    
    func setImageFromDevice(){
        self.typeOfBox = .picture
    }
}

@Observable
class ImageVideoDataList{
    
    var backgroundData: BackgroundData = BackgroundData()
    var listOfEntries: [ImageVideoData] = [ImageVideoData()]
    
    init() {
        // Example URLs - replace these with actual URLs you want to use
        let videoURLs = [
            URL(string: "https://www.youtube.com/watch?v=3uEbkUmS29A")!,
            URL(string: "https://www.youtube.com/watch?v=lmiuwcqwT_M")!,
            URL(string: "https://www.youtube.com/watch?v=Zh_7VjoXALI")!,
            URL(string: "https://www.youtube.com/watch?v=3uEbkUmS29A")!,
            URL(string: "https://www.youtube.com/watch?v=lmiuwcqwT_M")!,
            URL(string: "https://www.youtube.com/watch?v=Zh_7VjoXALI")!
        ]
        
        self.listOfEntries = videoURLs.map { url in
            let item = ImageVideoData()
            item.videoID = url
            item.typeOfBox = .video // Set the typeOfBox property to .video
            // Set other properties as needed
            return item
        }
        
        // Create an additional entry for type .text
        let textItem = ImageVideoData()
        textItem.typeOfBox = .text // Set the typeOfBox property to .text
        // Set other properties specific to the text entry as needed
        // For example, setting up a default or specific text, URL, etc.
        // textItem.webAddress = "https://example.com"
        // textItem.textCustomModel.text = "Example Text Content"

        // Append the text entry to the listOfEntries
        self.listOfEntries.append(textItem)
        
        let imageItem = ImageVideoData()
        imageItem.typeOfBox = .picturefromweb
        
        self.listOfEntries.append(imageItem)
    }
    
    var buttonsForMenu : [MenuEnum] = [.text, .image, .video, .background]
    
    func addNewItemToBoxList(){
        self.listOfEntries.append(ImageVideoData())
    }
    
}
/*
 URL(string: "https://www.youtube.com/watch?v=3uEbkUmS29A")!,
 URL(string: "https://www.youtube.com/watch?v=lmiuwcqwT_M")!,
 URL(string: "https://www.youtube.com/watch?v=Zh_7VjoXALI")!
 */
