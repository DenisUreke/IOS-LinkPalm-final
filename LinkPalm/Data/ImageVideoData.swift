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
        /*let videoURLs = [
            URL(string: "https://www.youtube.com/watch?v=3uEbkUmS29A")!,
            URL(string: "https://www.youtube.com/watch?v=lmiuwcqwT_M")!
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
        
        self.listOfEntries.append(imageItem)*/
        
    }
    
    var buttonsForMenu : [MenuEnum] = [.text, .image, .video, .background]
    
    func addNewItemToBoxList(){
        self.listOfEntries.append(ImageVideoData())
    }
    
}

extension ImageVideoDataList{
    
    func createNewImageForList(){
        
        var newImage = ImageVideoData()
        newImage.imageData.createImage()
        newImage.setTypeOfBox(type: .picturefromweb)
        self.listOfEntries.append(newImage)
    }
    
    func createNewTitleForList(){
        
        var newTitle = ImageVideoData()
        newTitle.textCustomModel.createNewTextBox(isTitle:  true)
        newTitle.setTypeOfBox(type: .text)
        self.listOfEntries.append(newTitle)
    }
    
    func createNewTextForList(){
        
        var newText = ImageVideoData()
        newText.textCustomModel.createNewTextBox(isTitle:  false)
        newText.setTypeOfBox(type: .text)
        self.listOfEntries.append(newText)
    }
    
    func createNewVideoForList(){
        
        var newVideo = ImageVideoData()
        
        let videoArray : [String] =
        [
            "https://www.youtube.com/watch?v=xGmyTaCsv0c",
            "https://www.youtube.com/watch?v=qRdzw2Osl8o",
            "https://www.youtube.com/watch?v=I1188GO4p1E",
            "https://www.youtube.com/watch?v=yDsMZn3olF",
            "https://www.youtube.com/watch?v=ybYvfw4HJVQ",
            "https://www.youtube.com/watch?v=nAchMctX4YA",
            "https://www.youtube.com/watch?v=CwA1VWP0Ldw",
            "https://www.youtube.com/watch?v=-TkoO8Z07hI",
            "https://www.youtube.com/watch?v=3qwPAwahTWI",
            "https://www.youtube.com/watch?v=EExSSotojVI",
            "https://www.youtube.com/watch?v=tPFNnnASAJs"
        ]
        
        if let randomURLString = videoArray.randomElement(), let url = URL(string: randomURLString) {
            newVideo.videoID = url
        } else {
            print("Failed to create a URL in videoCreateFunction.")
        }
        newVideo.setTypeOfBox(type: .video)
        self.listOfEntries.append(newVideo)
    }
}
    






/*
 URL(string: "https://www.youtube.com/watch?v=3uEbkUmS29A")!,
 URL(string: "https://www.youtube.com/watch?v=lmiuwcqwT_M")!,
 URL(string: "https://www.youtube.com/watch?v=Zh_7VjoXALI")!
 */
