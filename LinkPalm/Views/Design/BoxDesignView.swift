//
//  BoxDesignView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import SwiftUI

struct BoxDesignView: View {
    
    @Binding var designData : ImageVideoDataList
    @State var choice = MenuEnum.image
    @State var navigate : Bool = false
    
    var body: some View {
        VStack() {
            ScrollView(showsIndicators: false){
                DrawMenuForBoxDesignView(designData: $designData, title: "Add New Item")
            }
            
        }
    }
}


struct DrawMenuForBoxDesignView: View {
    
    @Binding var designData: ImageVideoDataList
    @State var newObject: ImageVideoData = ImageVideoData()
    let title: String
    @State private var selectedOption: MenuEnum? = nil


    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(MenuEnum.allCases, id: \.self) { option in
                        NavigationLink(destination: destinationView(for: option)){
                            DrawDynamicButton(selectedMenuButton: option)
                        }
                    }
                }
                .navigationTitle(title)
            }
            .padding(62)
        }
    }

    @ViewBuilder
    private func destinationView(for option: MenuEnum?) -> some View {
        switch option {
        case .image:
            PhotoView(designData: $designData, newObject: $newObject, isForList: true)
        case .text:
            configurateTextObjects(titleData: $designData, data: $newObject)
        case .video:
            VideoDesignView(list: $designData, designData: $newObject)
        case .background:
            BackgroundDesignView(designData: $designData.backgroundData)
        default:
            EmptyView()
        }
    }
    
}

struct DynamicButtonWithNavigation: View {
    let icon: String
    let title: String
    
    var body: some View {
        Button(action: {
            print("Button was tapped")
        }) {
            ButtonDesign(icon: icon, title: title, borderColor: Color.black, borderThickness: 2, width: 180, height:50 )
        }
    }
}

struct DynamicButtonWithFunction: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ButtonDesign(icon: icon, title: title, borderColor: Color.black, borderThickness: 2, width: 180, height:50 )
        }
    }
}

struct ButtonDesign: View {
    let icon: String
    let title: String
    let borderColor: Color
    let borderThickness: Double
    let width: Double
    let height: Double

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
                .offset(x: 20)
                .padding(.trailing, 5)
            Text(title)
                .frame(width: 70)
                .font(.system(size: 16))
                .foregroundStyle(Color.black)
                .offset(x: -10)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.white)
                .frame(width: width, height: height)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(borderColor, lineWidth: borderThickness)))
        .shadow(color: .gray, radius: 10, x: 0, y: 4)
        .padding()
    }
}


/*#Preview {
    BoxDesignView(designData: .constant(UserDesignModel()))
}*/
