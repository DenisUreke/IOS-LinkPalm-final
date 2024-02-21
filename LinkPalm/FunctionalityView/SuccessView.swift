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
    

    var body: some View {
        VStack {
            
            if let urlString = userList.userList.last?.personData?.result.picture.large,
               let url = URL(string: urlString) {
                Text("\(message)")
                    .padding(.bottom, 100)
                    .font(.largeTitle)
                AsyncImage(url: url) { phase in
                    switch phase {
                        case .success(let image):
                            image.resizable()
                                 .aspectRatio(contentMode: .fill)
                                 .frame(width: 200, height: 200) // Doubled the image size
                                 .clipShape(Circle())
                                 .overlay(
                                    Circle().stroke(Color.white, lineWidth: 4) // Adds a white border with a line width of 4
                                 )
                                 .offset(y: -40)
                                 .background(
                                    RoundedRectangle(cornerRadius: 10) // Larger corner radius for the background
                                        .fill(Color.gray.opacity(0.3)) // Example background color with slight transparency
                                        .frame(width: 260, height: 340) // Slightly larger than the image
                                 )
                                 .shadow(color: .gray, radius: 10, x: 0, y: 4)
                        
                        Text("\(userList.userList.last?.personData?.result.name.first ?? "") \(userList.userList.last?.personData?.result.name.last ?? "")")
                            .font(.title)
                        
                        Spacer()
                        
                        NavigationLink(destination: CardView(user: $userList.userList.last!)){
                            ButtonDesign(icon: "person.crop.circle", title: "See Card", borderColor: .black, borderThickness: 2, width: 220, height: 50)
                        }
                        /*.navigationTitle("\(userList.userList.last?.personData?.result.name.first ?? "") \(userList.userList.last?.personData?.result.name.last ?? "")")*/
                        case .failure(_):
                            Image(systemName: "photo")
                                .frame(width: 200, height: 200) // Adjusted for consistency
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
        // Removed the frame and clipShape from VStack as they are no longer needed
    }
}
