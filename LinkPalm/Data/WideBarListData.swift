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
class WideBarListData: Identifiable{
    
    var id = UUID().uuidString
    var listOfIcons: [WideBarListDataicons]
    var buttonCount: Int
    
    init(buttonCount: Int = 1, listOfIcons: [WideBarListDataicons] = [WideBarListDataicons()]) {
        self.listOfIcons = listOfIcons
        self.buttonCount = buttonCount
    }
    
    func addNewButtonToWideList(){
        if self.buttonCount < 8{
            if let lastButton = listOfIcons.last{
                let newButton = WideBarListDataicons(copying: lastButton)
                self.listOfIcons.append(newButton)
                self.buttonCount += 1
                print("ButtonCount ", buttonCount)
            }
        }
    }
    
    func returnCorrectIndexAfterAdding() -> Int{
        self.addNewButtonToWideList()
        let currentIndex = self.buttonCount - 1
        print("Current Index", currentIndex)
        return currentIndex
    }
    
    func removeButtonFromWideList(){
        if self.buttonCount > 1{
            self.listOfIcons.removeLast()
            self.buttonCount -= 1
            print("ButtonCount ", buttonCount)
        }
    }
    
    func resetAdressValues(index: Int){
        self.listOfIcons[index].isWebLink = false
        self.listOfIcons[index].isVideoLink = false
        self.listOfIcons[index].webAddress = ""
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
