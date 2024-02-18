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
        VStack {
            
            if let scannedCode = session.scannedCode {
                SuccessView(userList: $userList, message: scannedCode)
            }
            
            Text(String(describing: session.connectedPeers.map(\.displayName)))
            
            Button(action: {
                
            }){
                ButtonDesign(icon: "iphone.gen1.radiowaves.left.and.right", title: "Share Contact", borderColor: .black, borderThickness: 2, width: 240, height: 80)
            }
        }
        .onDisappear{
            session.passwordsMatch = .none
        }
        .padding()
    }
}
//session.send(userID: message)
