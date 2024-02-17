//
//  UserDesignModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import Foundation
import Observation
import SwiftUI
import SwiftData



//@Model
@Observable
final class UserDesignModel: Identifiable{
    
    let ID = UUID().uuidString
    let userID : String
    
    var boxOne = BoxData()
    var boxTwo = BoxData()
    var boxThree = BoxData()
    var boxFour = BoxData()
    var wideBarOne = WideBarData()
    var wideBarTwo = WideBarData()
    var wideBarThree = WideBarData()
    var firstName : String
    var lastName : String
    var typeOfContact : String
    
    init(userID: String = "1234", firstName: String = "John", lastName: String = "Doe", typeOfContact: String = "person") {
        
        self.userID = userID
        self.firstName = firstName
        self.lastName = lastName
        self.typeOfContact = typeOfContact
    }
    
}

@Observable
class UserDesignList{
    
    var userList: [UserDesignModel] = [UserDesignModel(), UserDesignModel(firstName: "Rick", lastName: "Morty")]
    
}

extension UserDesignList{
    
//-----------------
    func generateNumber(_ min: Int,_ max: Int) -> Int {
        return Int.random(in: min...max)
    }
//-----------------
    func returnRandomColor()-> Color{
        return StandardColors.allCases.randomElement()?.color ?? Color.black
    }
//-----------------
    func createAndPopulateUserDesign(){
        
        var newUser: UserDesignModel = UserDesignModel()
        self.userList.append(newUser)
        var newBox = BoxData()
        newUser.boxOne = newBox
        let downloader = DownloadDataModel()
        
        Task {
            do {
                try await downloader.fetchMemeData()
                // Accessing the title after fetching
                if let firstMemeTitle = downloader.memeData.first?.url {
                    print("First Meme Title: \(firstMemeTitle)")
                } else {
                    print("Meme data is empty.")
                }
                downloader.printFirstEntry()
            } catch {
                print("Error fetching meme data: \(error)")
            }
        }
        /*Task {
            do {
                try await downloader.fetchPersonData()
                print("Person Name \(downloader.personData?.result.name)")
            } catch {
                print("Error fetching person data: \(error)")
            }
        }*/
        /*Task {
            do {
                try await downloader.fetchImageData()
                print("Image path \(downloader.imagesData.last!.url)")
                // After fetching, you might want to do something with the data
            } catch {
                print("Error fetching image data: \(error)")
            }
        }*/
    }
//-----------------
    func styleText(){
        
    }
}
/*
 var text: String = "Your Text"
 var selectedSize: Double = 24
 var selectedStyle: FontStyle = .defaults
 var selectedWeight: FontWeight = .regularWeight
 var selectedColorBackground: StandardColors = .clear
 var selectedColorBackgroundTwo: StandardColors = .clear
 var selectedColorFont: StandardColors = .black
 var selectedOpacity: Double = 1
 var gradientIsClicked = false
 var shadowIsClicked = false
 var selectedBackgroundOpacity: Double = 1
 var selectedFontOpacity: Double = 1
 var selectedAlignment: FontAlignment = .alignmentCenter
 var selectedTextAlignment: FontTextAlignment = .TextAlignmentLeft
 var selectedBorderColor: StandardColors = .black
 var selectedBorderWidth: Double = 0
 var selectedCornerRadius: Double = 0
 var selectedImageCornerRadius: Double = 0
 var selectedXOffsetText: Double = 0
 
 */


// https://picsum.photos/300.jpg

//https://picsum.photos/300/300.jpg

//https://picsum.photos/300/300/?blur.jpg

// https://picsum.photos/200/500?grayscale.jpg
