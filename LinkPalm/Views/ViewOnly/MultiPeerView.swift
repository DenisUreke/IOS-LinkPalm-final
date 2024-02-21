//
//  MultiPeerView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-20.
//

import SwiftUI

struct MultiPeerView: View {
    
    @Binding var userList: UserDesignList
    var QRmodel: QRCodeModel
    var password: String = ""
    var session: ExchangeSession
    var userID: String
    var message: String = ""
    
    
    init(userList: Binding<UserDesignList>, QRmodel: QRCodeModel, password: String, userID: String) {
        self._userList = userList
        self.QRmodel = QRmodel
        self.password = password
        self.session = ExchangeSession(password: password, userList: userList.wrappedValue)
        self.userID = userID
        self.message = "\(userID) John Doe person \(password)"
    }

    var body: some View {
        
        if session.scannedCode == nil{
            usersLogged()
        }
        
            if let scannedCode = session.scannedCode {
                SuccessView(userList: $userList, message: scannedCode)
            }
            
            if session.passwordsDoNotMatch{
                PopUpErrorViewForMultiPeer(
                         text: "Passwords Do Not Match\nPlease enter correct one",
                         action: { newPassword in
                             session.resetpasswordsDoNotMatch(newPassword: newPassword)
                         }
                     )
            }
            
            Spacer()
            
            Button(action: {
                session.send(userID: message)
            }){
                ButtonDesign(icon: "iphone.gen1.radiowaves.left.and.right", title: "Share Contact", borderColor: .black, borderThickness: 2, width: 240, height: 80)
            }
        .onDisappear{
            session.passwordsDoNotMatch = false
        }
        .padding()
    }
    
    func usersLogged() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Users connected")
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(session.connectedPeers.map(\.displayName).joined(separator: ", "))
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)).shadow(radius: 5))
        .padding()
    }
}

//----------------------
//----------------------

struct PopUpErrorViewForMultiPeer: View {
    let text: String
    var action: (String) -> Void
    @State var selectedPassword: String = ""
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 300, height: 200)
                .shadow(radius: 5)
                .overlay(
                    Text(text)
                        .foregroundColor(.red)
                )
            TextField("Enter password", text: $selectedPassword)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .onReceive(selectedPassword.publisher.collect()) {
                    selectedPassword = String($0).filter { "0123456789".contains($0) }
                }
                .padding(.horizontal)
            
            Button(action:{
                action(selectedPassword)
            })
            {
                ButtonDesign(icon: "x.square", title: "OK", borderColor: .black, borderThickness: 2, width: 180, height: 50)
            }
        }
    }
}

struct PopUpErrorViewWithFunction: View {
    let text: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 300, height: 200)
                .shadow(radius: 5)
                .overlay(
                    Text(text)
                        .foregroundColor(.red)
                )
            
            Button(action:{
                action()
            })
            {
                ButtonDesign(icon: "x.square", title: "OK", borderColor: .black, borderThickness: 2, width: 180, height: 50)
            }
        }
    }
}
