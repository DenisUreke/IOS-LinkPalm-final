//
//  MainView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-15.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @State var titleData: UserDesignList = UserDesignList()
    @State var QRmodel: QRCodeModel = QRCodeModel()
    @State var user: UserDesignModel = UserDesignModel(userID: "1234", typeOfContact: "person", isEditable: true)
    
    var body: some View {
        ZStack{
            BackgroundColorView()
            
            HStack{
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(MainMenuEnum.allCases, id: \.self) { object in
                        NavigationLink(destination: self.destinationView(menu: object)) {
                            DrawDynamicButton(selectedMenuButton: object)
                        }
                    }
                }
            }
        }
    }
    @ViewBuilder
    private func destinationView(menu: MainMenuEnum) -> some View {
        switch menu {
        case .person:
            ContactsListView(designList: $titleData)
                .navigationTitle("Contacts")
        case .share:
            ShareContactView(user: user, userList: $titleData, QRmodel: QRmodel)
                .navigationTitle("Share Contact")
        case .yourProfile:
            CardView(user: $user)
        }
    }
}
