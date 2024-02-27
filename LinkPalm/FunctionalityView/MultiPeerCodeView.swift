//
//  MultiPeerCode.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-20.
//

import SwiftUI

struct MultiPeerCodeView: View {
    var user: UserDesignModel
    @Binding var userList: UserDesignList
    
    @State var selectedPassword: String = ""

    var body: some View {
        ZStack{
            BackgroundColorView()

            VStack{
                drawTextfieldForPeer(selectedPassword: $selectedPassword)
                
                VStack{
                    NavigationLink(destination: MultiPeerView(userList: $userList, password: $selectedPassword, userID: user.userID)) {
                        DrawDynamicButton(selectedMenuButton: ShareContactEnum.peer)
                    }
                }
            }
            
        }
    }
}

struct drawTextfieldForPeer: View {
    
    @Binding var selectedPassword: String
    
    var body: some View{
        
        TextField("Enter password", text: $selectedPassword)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .onReceive(selectedPassword.publisher.collect()) {
                self.selectedPassword = String($0).filter { "0123456789".contains($0) }
            }
            .padding(.horizontal)
            .frame(width: 300, height: 40)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(30)
    }
    
}

