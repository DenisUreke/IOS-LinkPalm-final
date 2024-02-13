//
//  BoxDesignView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import SwiftUI

struct BoxDesignView: View {
    
    @Binding var designData : UserDesignModel
    @State var choice = MenuEnum.image
    
    var body: some View {
        VStack() {
            ScrollView(showsIndicators: false){
                DrawMenuForBoxDesignView(designData: $designData.boxOne.imageVideoListData, title: "Add New Item")
            }
            
        }
    }
}


struct DrawMenuForBoxDesignView: View {
    @Binding var designData: ImageVideoDataList
    let title: String

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Text(title).font(.system(size: 26, weight: .bold))
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(MenuEnum.allCases, id: \.self) { option in
                        NavigationLink(destination: destinationView(for: option)) {
                            drawButtonForBoxDesing(selectedMenuButton: option)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            self.designData.addNewItemToBoxList()
                        })
                    }
                }
            }
            .navigationBarTitle(title, displayMode: .inline)
        }
        
    }
    @ViewBuilder
    private func destinationView(for option: MenuEnum) -> some View {
        switch option {
        case .image:
            EmptyView()
        case .text:
            configurateTextObjects(titleData: $designData.listOfEntries.last!)
        case .video:
            EmptyView()
        case .background:
            EmptyView()
        }
    }
}

struct drawButtonForBoxDesing : View{
    
    var selectedMenuButton: MenuEnum
    
    var body: some View {
        HStack{
            Image(systemName: "\(selectedMenuButton.sfSymbol)")
                .foregroundColor(.black)
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

struct DynamicButtonWithNavigation: View {
    let icon: String
    let title: String
    
    var body: some View {
        Button(action: {
            print("Button was tapped")
        }) {
            ButtonDesign(icon: icon, title: title)
        }
    }
}

struct DynamicButtonWithFunction: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ButtonDesign(icon: icon, title: title)
        }
    }
}

struct ButtonDesign: View {
    var icon: String
    var title: String

    var body: some View {
        HStack(spacing: 40) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .font(.title2)
                .frame(width: 20, height: 20)
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                        .fill(Color.white)
                        .frame(width: 40, height: 40)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                                .stroke(Color.black, lineWidth: 1)))
                .shadow(color: .gray, radius: 10, x: 0, y: 4)
            Text(title)
                .font(.title2)
                .foregroundStyle(Color.black)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.gray.opacity(0.1))
                .frame(width: 180, height: 50)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(Color.blue, lineWidth: 2)))
        .padding()
    }
}

#Preview {
    BoxDesignView(designData: .constant(UserDesignModel()))
}
