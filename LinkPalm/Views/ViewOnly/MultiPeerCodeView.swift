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
    var QRmodel: QRCodeModel
    
    @State private var selectedPassword: String = ""

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundColor(.gray)

            TextField("Enter password", text: $selectedPassword)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .onReceive(selectedPassword.publisher.collect()) {
                    self.selectedPassword = String($0).filter { "0123456789".contains($0) }
                }
                .padding(.horizontal)
        }
        .frame(height: 40)
        .padding()
        VStack{
            NavigationLink(destination: MultiPeerView(userList: $userList, QRmodel: QRmodel, password: selectedPassword, userID: user.userID)) {
                ButtonDesign(icon: "iphone.gen1.radiowaves.left.and.right", title: "Start Session", borderColor: .black, borderThickness: 2, width: 180, height: 50)
            }
        }
        
        
    }
}

