//
//  UserDesignListModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-21.
//

import Foundation
import Observation
import SwiftUI

@Observable
class UserDesignList{
    
    var userList: [UserDesignModel] = []
    
    func checkIfContactExists(components: [String]) -> Bool{
        return userList.contains(where: { $0.userID == components[0] })
    }
}

extension UserDesignList{
    
    func createAndPopulate(components: [String]) {
        Task {
            do {
                
                let (person, memes) = try await fetchData()
                
                DispatchQueue.main.async {
                    if memes.count >= 3 {
                        let randomMemes = Array(memes.shuffled().prefix(3))
                        let urls = randomMemes.compactMap { $0.url } // Extracting URLs from the selected memes
                        // Now urls is an array of URL objects that you can pass as expected
                        
                        let newUser = UserDesignModel(userID: components[0], typeOfContact: components[3], personData: person)
                        newUser.createData(imageURL: newUser.personData?.result.picture.large ?? "", meme: urls)
                        self.userList.append(newUser)
                        self.userList.last!.wideBarOne.wideBarListData.listOfIcons.last!.createHeaderWithName(firstName: person?.result.name.first ?? "Name Not found", lastName: person?.result.name.last ?? "Name Not Found")
                        self.userList.last!.wideBarTwo.wideBarListData.createButtonsForWideBar()
                    }
                    
                    
                    memes.forEach { meme in
                        print("Meme: \(meme.title), URL: \(String(describing: meme.url))")
                    }
                }
            } catch {
                print("An error occurred: \(error)")
            }
        }
    }
}
