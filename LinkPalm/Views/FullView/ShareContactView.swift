//
//  QRSwitchView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-15.
//

import SwiftUI

struct ShareContactView: View {

    var user: UserDesignModel
    @Binding var userList: UserDesignList
    
    var body: some View {
        ZStack{
            BackgroundColorView()
            
            HStack{
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(ShareContactEnum.allCases, id: \.self) { object in
                        NavigationLink(destination: self.destinationView(menu: object)) {
                            DrawDynamicButton(selectedMenuButton: object)
                        }
                    }
                }
            }
        }
    }
    @ViewBuilder
    private func destinationView(menu: ShareContactEnum) -> some View {
        switch menu {
        case .create:
            QRCreateView(personID: user)
        case .read:
            QRScanView(userDesign: $userList)
        case .peer:
            MultiPeerCodeView(user: user, userList: $userList)
        }
    }
    
}
