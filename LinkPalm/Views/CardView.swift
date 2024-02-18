//
//  TemplateOneView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import SwiftUI

struct CardView: View {
    
    @State var isEditMode: Bool = false
    @Binding var user : UserDesignModel
    
    var body: some View {
        
        GeometryReader{ geometry in
            VStack(spacing: 5) {
                
                //WideBar 1
                if isEditMode{
                    openView(.widebar, boxData: nil, imageVideoList: nil, wideBarListData: $user.wideBarOne.wideBarListData, isEditMode: $isEditMode, geometry: geometry, wOne: 1, wTwo: 10, hOne: 0.1, hTwo: 5)
                }else{
                    
                    openView(.cleanWideBar, boxData: nil, imageVideoList: nil, wideBarListData: $user.wideBarOne.wideBarListData, isEditMode: $isEditMode, geometry: geometry, wOne: 1, wTwo: 10, hOne: 0.1, hTwo: 5)
                }
                // Box 1, 2
                HStack(spacing: 5) {
                    if isEditMode{
                        openView(.cardView, boxData: $user.boxOne, imageVideoList: $user.boxOne.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 0.6, wTwo: 15, hOne: 0.25, hTwo: 15)
                    }
                    else{
                        openView(.box, boxData: $user.boxOne, imageVideoList: $user.boxOne.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 0.6, wTwo: 15, hOne: 0.25, hTwo: 15)
                    }
                    if isEditMode{
                        openView(.cardView, boxData: $user.boxTwo, imageVideoList: $user.boxTwo.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 0.4, wTwo: 0, hOne: 0.25, hTwo: 15)
                    }
                    else{
                        openView(.box, boxData: $user.boxTwo, imageVideoList: $user.boxTwo.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 0.4, wTwo: 0, hOne: 0.25, hTwo: 15)
                    }
                }
                // WideBar 2
                if isEditMode{
                    openView(.widebar, boxData: nil, imageVideoList: nil, wideBarListData: $user.wideBarTwo.wideBarListData, isEditMode: $isEditMode, geometry: geometry, wOne: 1, wTwo: 10, hOne: 0.1, hTwo: 5)
                }else{
                    openView(.cleanWideBar, boxData: nil, imageVideoList: nil, wideBarListData: $user.wideBarTwo.wideBarListData, isEditMode: $isEditMode, geometry: geometry, wOne: 1, wTwo: 10, hOne: 0.1, hTwo: 5)
                }
                // Box 3, 4
                HStack(spacing: 5) {
                    if isEditMode{
                        openView(.cardView, boxData: $user.boxThree, imageVideoList: $user.boxThree.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 0.5, wTwo: 7.5, hOne: 0.25, hTwo: 15)
                    }
                    else{
                        openView(.box, boxData: $user.boxThree, imageVideoList: $user.boxThree.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 0.5, wTwo: 7.5, hOne: 0.25, hTwo: 15)
                    }
                    if isEditMode{
                        openView(.cardView, boxData: $user.boxFour, imageVideoList: $user.boxFour.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 0.5, wTwo: 7.5, hOne: 0.25, hTwo: 15)
                    }
                    else{
                        openView(.box, boxData: $user.boxFour, imageVideoList: $user.boxFour.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 0.5, wTwo: 7.5, hOne: 0.25, hTwo: 15)
                    }
                }
                // Box 5
                if isEditMode{
                    openView(.cardView, boxData: $user.boxFive, imageVideoList: $user.boxFive.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 1, wTwo: 10, hOne: 0.35, hTwo: 20)
                }
                else{
                    openView(.box, boxData: $user.boxFive, imageVideoList: $user.boxFive.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 1, wTwo: 10, hOne: 0.35, hTwo: 20)
                }
                
            }
            .toolbar {
                drawToolBar()
            }
            .padding(5)
        }
    }
    private func openView(_ type: CardViewEnum, boxData: Binding<BoxData>?, imageVideoList: Binding<ImageVideoDataList>?, wideBarListData: Binding<WideBarListData>?, isEditMode: Binding<Bool>, geometry: GeometryProxy, wOne: Double, wTwo: Double, hOne: Double, hTwo: Double) -> AnyView{
        
        switch type {
        case .box:
            return AnyView( NavigationLink(destination: BoxView(titleData: imageVideoList!)){
                CardViewBox(boxData: boxData!, userDesign: imageVideoList!)
                    .frame(width: (geometry.size.width * wOne) - wTwo, height: (geometry.size.height * hOne) - hTwo)
                    .fixedSize()
                    .clipped()
            })
        case .widebar:
            return AnyView(NavigationLink(destination: WideBarEditView(userDesign: wideBarListData!)){
                WideBarListView(userDesign: wideBarListData!, isEditMode: isEditMode)
                    .frame(width: (geometry.size.width * wOne) - wTwo, height: (geometry.size.height * hOne) - hTwo)
                    .fixedSize()
                    .clipped()
            })
        case .cardView:
            return AnyView(NavigationLink(destination: CardViewDesignBox(boxData: boxData!, userDesign: imageVideoList!)){
                CardViewBox(boxData: boxData!, userDesign: imageVideoList!)
                    .frame(width: (geometry.size.width * wOne) - wTwo, height: (geometry.size.height * hOne) - hTwo)
                    .fixedSize()
                    .clipped()
            })
        case .cleanWideBar:
            return AnyView(WideBarListView(userDesign: wideBarListData!, isEditMode: isEditMode)
                .frame(width: (geometry.size.width * wOne) - wTwo, height: (geometry.size.height * hOne) - hTwo)
                .fixedSize()
                .clipped()
        )}
    }
    
    private func drawToolBar()-> some ToolbarContent{
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            Menu {
                Button(action: {
                    self.isEditMode.toggle()
                }) {
                    Label(isEditMode ? "Exit Edit Mode" : "Edit Mode", systemImage: isEditMode ? "xmark.circle" : "square.and.pencil")
                }
            } label: {
                Label("Menu", systemImage: "line.3.horizontal")
            }
        }
    }
}
