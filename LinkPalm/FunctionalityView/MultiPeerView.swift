//
//  MultiPeerView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-20.
//

import SwiftUI
import SwiftData

struct MultiPeerView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query private var qrUsersList: [QRCodeData]
    @Binding var password: String
    @Binding var userList: UserDesignList
    var session: ExchangeSession
    var userID: String
    
    
    init(userList: Binding<UserDesignList>, password: Binding<String>, userID: String) {
        self._userList = userList
        self._password = password
        self.userID = userID
        self.session = ExchangeSession(password: password.wrappedValue, userList: userList.wrappedValue)
    }

    var body: some View {
        
        ZStack{
            BackgroundColorView()
            VStack{
                if session.scannedCode == nil{
                    usersLogged()
                }
                
                if let scannedCode = session.scannedCode {
                    SuccessView(userList: $userList, message: scannedCode)
                }
                
                if session.passwordsDoNotMatch{
                    PopUpErrorViewForMultiPeer(
                        text: "Passwords Do Not Match",
                        action: { newPassword in
                            session.resetpasswordsDoNotMatch(newPassword: newPassword)
                        }, password: $password
                    )
                }
                
                Spacer()
                
                Button(action: {
                    session.send(userID: userID, firstName: "John", lastName: "Doe", typeOfContact: "person", password: password)
                }){
                    DrawDynamicButton(selectedMenuButton: ButtonEnum.share)            }
                .onDisappear{
                    session.passwordsDoNotMatch = false
                    session.scannedCode = nil
                }
                .padding()
                .onChange(of: session.scannedCode, initial: (session.scannedCode != nil)) { previousValue, currentValue in
                    if currentValue != nil && currentValue != "Contact already exists" {
                        self.updateDataBase()
                    }
                }
            }
        }
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
    func updateDataBase(){
        let QRModel = QRCodeData(component: session.components)
        //modelContext.insert(QRModel)
    }
}

//----------------------
//----------------------

struct PopUpErrorViewForMultiPeer: View {
    let text: String
    var action: (String) -> Void
    @State private var selectedPassword: String = ""
    @Binding var password: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 360, height: 240)
                .shadow(radius: 5)
                .overlay(
                    VStack(spacing: 10) {
                        Spacer()
                        Text(text)
                            .foregroundColor(.red)
                        
                        drawTextfieldForPeer(selectedPassword: $selectedPassword)
                            .padding(.top, -25)
                        
                        Button(action: {
                            password = selectedPassword
                            action(selectedPassword)
                        }) {
                            DrawDynamicButton(selectedMenuButton: ButtonEnum.ok)
                                .scaleEffect(0.6)
                        }
                        .padding(.top, -30)
                        .padding(.bottom, -40)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
    }
    
}
