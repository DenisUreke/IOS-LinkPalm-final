//
//  MainView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-15.
//

import SwiftUI

struct MainView: View {
    
    @State var titleData: UserDesignList = UserDesignList()
    @State var QRmodel: QRCodeModel = QRCodeModel()
    
    var body: some View {
        
        HStack{
            LazyVGrid(columns: [GridItem(.flexible())]) {
                ForEach(MainMenuEnum.allCases, id: \.self) { object in
                    NavigationLink(destination: self.destinationView(menu: object)) {
                        drawButtonForMenu(selectedMenuButton: object)
                    }
                }
            }
        }
        
    }
    @ViewBuilder
    private func destinationView(menu: MainMenuEnum) -> some View {
        switch menu {
        case .person:
            ContactsListView(QRList: $QRmodel, designList: $titleData)
        case .share:
            ShareContactView()
        case .yourProfile:
            ProfileView()
        }
    }
}
    
    struct ContactsView: View {
        var body: some View {
            Text("Your Contacts")
        }
    }

    struct ShareContactView: View {
        var body: some View {
            Text("Share Contact")
        }
    }

    struct ProfileView: View {
        var body: some View {
            Text("Your Profile")
        }
    }

struct drawButtonForMenu : View{
    
    var selectedMenuButton: MainMenuEnum
    
    var body: some View {
        HStack{
            Image(systemName: "\(selectedMenuButton.sfSymbol)")
                .foregroundColor(.blue)
                .font(.largeTitle)
                .frame(width: 50, height: 50)
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                        .fill(Color.white)
                        .frame(width: 80, height: 80)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                                .stroke(Color.black, lineWidth: 1)))
                .shadow(color: .gray, radius: 10, x: 0, y: 4)
            Spacer()
            Text("\(selectedMenuButton.rawValue)")
                .font(.title2)
                .foregroundStyle(Color.black)
            Spacer()
            Image(systemName: "arrowtriangle.right")
                .foregroundColor(.black)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.gray.opacity(0.1))
                .frame(width: 360, height: 100)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(Color.black, lineWidth: 1)))
        .padding()
    }
    
}




/*#Preview {
    MainView()
}*/
