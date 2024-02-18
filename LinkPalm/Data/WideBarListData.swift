//
//  WideBarListModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import Foundation
import Observation
import SwiftUI
import SwiftData

//@Model
@Observable
class WideBarListDataicons: Identifiable{
    
    let id: String
    var sfIcon: SFSymbolEnum
    var isWebLink: Bool
    var isVideoLink: Bool
    var webAddress: String
    var iconSize: Double
    var iconColor: StandardColors
    var iconOpacity: Double
    var backgroundColor: StandardColors
    var backgroundColorTwo: StandardColors
    var backgroundOpacity: Double
    var gradientIsClicked: Bool
    var text: String
    
    var selectedSize: Double
    var selectedStyle: FontStyle
    var selectedWeight: FontWeight
    var selectedColorBackground: StandardColors
    var selectedColorBackgroundTwo: StandardColors
    var selectedColorFont: StandardColors
    var selectedOpacity: Double
    var shadowIsClicked: Bool
    var selectedFontOpacity: Double
    var selectedAlignment: FontAlignment
    var selectedTextAlignment: FontTextAlignment
    
    let sizeOptions = [FontSize.title1, .title2, .title3]
    let styleOptions = [FontStyle.defaults, .monoSpaced, .serif]
    let weightOptions = [FontWeight.regularWeight, .semiBoldWeight, .boldWeight]
    let alignmentOptions = [FontAlignment.alignmentCenter, .alignmentLeft, .alignmentRight]
    let textAlignmentOptions = [FontTextAlignment.TextAlignmentLeft, .TextAlignmentCenter, .TextAlignmentRight]

    init(sfIcon: SFSymbolEnum = .none,
         isWebLink: Bool = false,
         isVideoLink: Bool = false,
         webAddress: String = "",
         iconSize: Double = 24,
         iconColor: StandardColors = .black,
         iconOpacity: Double = 1,
         backgroundColor: StandardColors = .gray,
         backgroundColorTwo: StandardColors = .clear,
         backgroundOpacity: Double = 1,
         gradientIsClicked: Bool = false,
         text: String = "",
         selectedSize: Double = 24,
         selectedStyle: FontStyle = .defaults,
         selectedWeight: FontWeight = .regularWeight,
         selectedColorBackground: StandardColors = .clear,
         selectedColorBackgroundTwo: StandardColors = .clear,
         selectedColorFont: StandardColors = .black,
         selectedOpacity: Double = 1,
         shadowIsClicked: Bool = false,
         selectedFontOpacity: Double = 1,
         selectedAlignment: FontAlignment = .alignmentCenter,
         selectedTextAlignment: FontTextAlignment = .TextAlignmentLeft) {
        
        self.id = UUID().uuidString
        self.sfIcon = sfIcon
        self.isWebLink = isWebLink
        self.isVideoLink = isVideoLink
        self.webAddress = webAddress
        self.iconSize = iconSize
        self.iconColor = iconColor
        self.iconOpacity = iconOpacity
        self.backgroundColor = backgroundColor
        self.backgroundColorTwo = backgroundColorTwo
        self.backgroundOpacity = backgroundOpacity
        self.gradientIsClicked = gradientIsClicked
        self.text = text
        self.selectedSize = selectedSize
        self.selectedStyle = selectedStyle
        self.selectedWeight = selectedWeight
        self.selectedColorBackground = selectedColorBackground
        self.selectedColorBackgroundTwo = selectedColorBackgroundTwo
        self.selectedColorFont = selectedColorFont
        self.selectedOpacity = selectedOpacity
        self.shadowIsClicked = shadowIsClicked
        self.selectedFontOpacity = selectedFontOpacity
        self.selectedAlignment = selectedAlignment
        self.selectedTextAlignment = selectedTextAlignment
    }

    init(copying icon: WideBarListDataicons) {
        
        self.id = UUID().uuidString
        self.sfIcon = icon.sfIcon
        self.isWebLink = false
        self.webAddress = ""
        self.iconSize = icon.iconSize
        self.iconColor = icon.iconColor
        self.iconOpacity = icon.iconOpacity
        self.backgroundColor = icon.backgroundColor
        self.backgroundColorTwo = icon.backgroundColorTwo
        self.backgroundOpacity = icon.backgroundOpacity
        self.gradientIsClicked = icon.gradientIsClicked
        self.text = icon.text
        self.isVideoLink = false
        
        self.selectedSize = icon.selectedSize
        self.selectedStyle = icon.selectedStyle
        self.selectedWeight = icon.selectedWeight
        self.selectedColorBackground = icon.selectedColorBackground
        self.selectedColorBackgroundTwo = icon.selectedColorBackgroundTwo
        self.selectedColorFont = icon.selectedColorFont
        self.selectedOpacity = icon.selectedOpacity
        self.shadowIsClicked = icon.shadowIsClicked
        self.selectedFontOpacity = icon.selectedFontOpacity
        self.selectedAlignment = icon.selectedAlignment
        self.selectedTextAlignment = icon.selectedTextAlignment
    }

}

extension WideBarListDataicons{
    
    func createHeaderWithName(firstName: String, lastName: String){
        self.text = "\(firstName) \(lastName)"
        self.designTextWideBar()
        self.selectedSize = 32
    }
    
    func createButton(){
        self.chooseSymbolOrText()
        self.linkVideoOrWebite()
    }
    
    func chooseSymbolOrText(){
        let random = Bool.random()
        
        if random {
            self.sfIcon = randomSFSymbol()
            self.designIconWideBar()
        }else{
            self.text = generatePlaceholderText(wordCount: 1)
            self.designTextWideBar()
        }
    }
    
    func linkVideoOrWebite(){
        
        let random = Bool.random()
        
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
        
        if random{
            self.isVideoLink = true
            self.webAddress = videoArray.randomElement()!
        }else{
            self.isWebLink = true
            self.webAddress = "https://picsum.photos/300/300.jpg"
        }
    }
    
    func designTextWideBar(){

        self.selectedSize = 24
        self.selectedStyle = .defaults
        self.selectedWeight = .regularWeight
        self.selectedColorBackground = randomStandardColor()
        self.selectedColorBackgroundTwo = randomStandardColor()
        self.backgroundColor = randomStandardColor()
        self.backgroundColorTwo = randomStandardColor()
        self.selectedColorFont = randomStandardColor()
        self.selectedOpacity = 1
        self.shadowIsClicked = Bool.random()
        self.selectedFontOpacity = 1
        self.selectedAlignment = .alignmentCenter
        self.selectedTextAlignment = .TextAlignmentLeft
        
    }
    
    func designIconWideBar(){
        
        self.iconSize = generateNumber(24, 48)
        self.iconColor = randomStandardColor()
        self.iconOpacity = 1
        self.backgroundColor = randomStandardColor()
        self.backgroundColorTwo = randomStandardColor()
        self.selectedColorBackground = randomStandardColor()
        self.selectedColorBackgroundTwo = randomStandardColor()
        self.backgroundOpacity = 1
        self.gradientIsClicked = Bool.random()
    }
        
    
}


//@Model
@Observable
class WideBarListData: Identifiable{
    
    var id = UUID()
    var buttonCount: Int
    var listOfIcons: [WideBarListDataicons]
    
    init(buttonCount: Int = 1, listOfIcons: [WideBarListDataicons] = [WideBarListDataicons()]) {
        self.buttonCount = buttonCount
        self.listOfIcons = listOfIcons
    }
    
    func addNewButtonToWideList(){
        
        if buttonCount < 8, let lastButton = listOfIcons.last {
            let newButton = WideBarListDataicons(copying: lastButton)
            listOfIcons.append(newButton)
            buttonCount += 1
        }
    }
    
    func removeButtonFromWideList(){
        if buttonCount > 1{ listOfIcons.removeLast()
            buttonCount -= 1
        }
    }
    
    func resetAdressValues(){
        self.listOfIcons.last!.isWebLink = false
        self.listOfIcons.last!.isVideoLink = false
        self.listOfIcons.last!.webAddress = ""
    }
    
    func checkIfLinkExists() -> Bool{
        return self.listOfIcons.last!.isWebLink || self.listOfIcons.last!.isVideoLink
    }
    
}

extension WideBarListData{
    
    func createButtonsForWideBar(){
        
        self.listOfIcons.first!.createButton()
        let randomNumber = Int(generateNumber(2, 4))
        
        for _ in 0...randomNumber{
            self.addNewButtonToWideList()
            resetValues()
            self.listOfIcons.last!.createButton()
        }
        
        func resetValues(){
            self.listOfIcons.last!.text = ""
            self.listOfIcons.last!.sfIcon = .none
        }
        
    }
}
