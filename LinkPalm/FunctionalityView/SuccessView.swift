//
//  SuccessView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-17.
//

import SwiftUI
import SwiftData

struct SuccessView: View {
    @Binding var userList: UserDesignList
    let message: String
    let userDetails: (firstName: String, lastName: String, imageURL: String)
    
    init(userList: Binding<UserDesignList>, message: String) {
        self._userList = userList
        self.message = message
        if let lastUser = userList.wrappedValue.userList.last {
            self.userDetails = userList.wrappedValue.returnCorrectValuesAccordingToEnum(data: lastUser, typeOfContact: lastUser.typeOfContact)
        } else {
            self.userDetails = ("John", "Doe", "DefaultImageURL")
        }
    }
    

    var body: some View {
        VStack {
            
            if !userDetails.imageURL.isEmpty {
                Text("\(message)")
                    .padding(.bottom, 100)
                    .font(.largeTitle)
                AsyncImage(url: URL(string: userDetails.imageURL)) { phase in
                    switch phase {
                        case .success(let image):
                            image.resizable()
                                 .aspectRatio(contentMode: .fill)
                                 .frame(width: 200, height: 200)
                                 .clipShape(Circle())
                                 .overlay(
                                    Circle().stroke(Color.white, lineWidth: 4)
                                 )
                                 .offset(y: -40)
                                 .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .frame(width: 260, height: 340)
                                 )
                                 .shadow(color: .gray, radius: 10, x: 0, y: 4)
                        
                        Text("\(userDetails.firstName) \(userDetails.lastName)")
                            .lineLimit(1)
                            .font(.title)
                            .frame(width: 200)
                            .minimumScaleFactor(0.5)
                        
                        Spacer()
                        
                        NavigationLink(destination: CardView(user: $userList.userList.last!)){
                            ButtonDesign(icon: "person.crop.circle", title: "See Card", borderColor: .black, borderThickness: 2, width: 180, height: 50)
                        }
                        case .failure(_):
                            Image(systemName: "photo")
                                .frame(width: 200, height: 200)
                                .foregroundColor(.gray)
                        case .empty:
                            ProgressView()
                        @unknown default:
                            EmptyView()
                    }
                }
            } else {
                ProgressView()
            }
        }
    }
}
