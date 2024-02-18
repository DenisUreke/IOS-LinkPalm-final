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
    var imageData: ImageData
    var typeOfBox: ImageVideoEnum // Decides what View to be called from the list writer
    var textCustomModel: TitleCustomModel
    
    init(videoID: URL = URL(string: "https://www.youtube.com/watch?v=3uEbkUmS29A")!,
         webAdress: String = "",
         imageData: ImageData = ImageData(),
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
            self.imageData.imageURL = url
            self.typeOfBox = .picturefromweb
        } else {
            return
        }
    }
    
    func setImageFromDevice(){
        self.typeOfBox = .picture
    }
    
}

@Observable
//@Model
class ImageVideoDataList{
    
    var backgroundData: BackgroundData
    var listOfEntries: [ImageVideoData]
    var buttonsForMenu: MenuEnum

    init(backgroundData: BackgroundData = BackgroundData(),
         listOfEntries: [ImageVideoData] = [],
         buttonsForMenu: MenuEnum = .background) {
        
        self.backgroundData = backgroundData
        self.listOfEntries = listOfEntries
        self.buttonsForMenu = buttonsForMenu
    }
    
    func addNewItemToBoxList() {
        self.listOfEntries.append(ImageVideoData())
    }
    
    func insertAndAppendInList(object: ImageVideoData, type: ImageVideoEnum){
        object.typeOfBox = type
        self.listOfEntries.append(object)
    }
    
    func setVideoUrlFromString(string: String, data: ImageVideoData) {
        if let url = URL(string: string) {
            data.videoID = url
            data.typeOfBox = .video
            self.listOfEntries.append(data)
        } else {
            return
        }
    }
    
    func setTextAndAppendtoList(object: ImageVideoData){
        object.typeOfBox = .text
        self.listOfEntries.append(object)
    }
}

extension ImageVideoDataList{
    
    func createNewImageForList(meme: URL){
        
        let newImage = ImageVideoData()
        newImage.imageData.createImage(meme: meme)
        newImage.setTypeOfBox(type: .picturefromweb)
        self.listOfEntries.append(newImage)
    }
    
    func createNewTitleForList(){
        
        let newTitle = ImageVideoData()
        newTitle.textCustomModel.createNewTextBox(isTitle:  true)
        newTitle.setTypeOfBox(type: .text)
        self.listOfEntries.append(newTitle)
    }
    
    func createNewTextForList(){
        
        let newText = ImageVideoData()
        newText.textCustomModel.createNewTextBox(isTitle:  false)
        newText.setTypeOfBox(type: .text)
        self.listOfEntries.append(newText)
    }
    
    func createNewVideoForList(){
        
        let newVideo = ImageVideoData()
        
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
