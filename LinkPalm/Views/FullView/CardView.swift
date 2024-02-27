//
//  TemplateOneView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import SwiftUI
import SwiftData

struct CardView: View {
    
    @State var isEditMode: Bool = false
    @Binding var user : UserDesignModel
    
    var body: some View {
        
        VStack(spacing: -45) {
            VStack{
                if isEditMode{
                    
                    NavigationLink(destination: DesignHeaderForCardView(userName: $user.userName, boxData: $user.headerData, userDesign: $user.headerData.imageVideoListData)){
                        HeaderForCardView(boxData: $user.headerData, userDesign: $user.headerData.imageVideoListData, user: $user)
                            .frame(maxWidth: .infinity, maxHeight: 580)
                            .edgesIgnoringSafeArea(.all)
                    }
                }else{
                    HeaderForCardView(boxData: $user.headerData, userDesign: $user.headerData.imageVideoListData, user: $user)
                        .frame(maxWidth: .infinity, maxHeight: 580)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            .frame(maxHeight: 580)

            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(Color.white)
                    .frame(height: 400)
                    .offset(y: -30)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: -5)
                
                HStack{
                    headerInfo(user: $user)
                }
                .offset(y: -170)
                
                multipleBoxView(isEditMode: $isEditMode, user: $user)
                    .frame(height: 500)
            }
        }
    }
}

struct headerInfo: View {
    @Binding var user : UserDesignModel
    
    var body: some View{
        
        VStack{
            Text("\(user.userName) \(user.userLastName)")
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(1)
                .frame(width: 280, alignment: .leading)
                .minimumScaleFactor(0.3)
                .foregroundColor(Color.black)
                .padding(.leading, 15)
            
            if user.typeOfContact != .item{
                Text("\(user.personData?.result.location.city ?? "Jönköping"), \(user.personData?.result.location.country ?? "Sweden")")
                    .font(.title3)
                    .lineLimit(1)
                    .frame(width: 280, alignment: .leading)
                    .minimumScaleFactor(0.3)
                    .foregroundColor(Color.gray)
                    .padding(.leading, 15)
                    .padding(.top, -15)
            }else{
                Text("\(user.productData?.brand ?? "NewBrand")")
                    .font(.title3)
                    .lineLimit(1)
                    .frame(width: 280, alignment: .leading)
                    .minimumScaleFactor(0.3)
                    .foregroundColor(Color.gray)
                    .padding(.leading, 15)
                    .padding(.top, -15)
            }
        }
        Spacer()
        buttonDesignForSorting(icon: user.typeOfContact.asIcon)
            .scaleEffect(0.7)
        
    }
}

struct multipleBoxView: View{
    
    @Binding var isEditMode: Bool
    @Binding var user : UserDesignModel
    
    var body: some View {

            
            GeometryReader{ geometry in
                VStack(spacing: 5) {
                    
                    Spacer()
                    // Box 1, 2
                    HStack(spacing: 5) {
                        if isEditMode{
                            openView(.cardView, boxData: $user.boxOne, imageVideoList: $user.boxOne.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 0.5, wTwo: 7.5, hOne: 0.3, hTwo: 15)
                        }
                        else{
                            openView(.box, boxData: $user.boxOne, imageVideoList: $user.boxOne.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 0.5, wTwo: 7.5, hOne: 0.3, hTwo: 15)
                        }
                        if isEditMode{
                            openView(.cardView, boxData: $user.boxTwo, imageVideoList: $user.boxTwo.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 0.5, wTwo: 7.5, hOne: 0.3, hTwo: 15)
                            
                        }
                        else{
                            openView(.box, boxData: $user.boxTwo, imageVideoList: $user.boxTwo.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 0.5, wTwo: 7.5, hOne: 0.3, hTwo: 15)
                        }
                    }
                    // WideBar
                    if isEditMode{
                        openView(.widebar, boxData: nil, imageVideoList: nil, wideBarListData: $user.wideBarOne.wideBarListData, isEditMode: $isEditMode, geometry: geometry, wOne: 1, wTwo: 10, hOne: 0.13, hTwo: 5)
                    }else{
                        openView(.cleanWideBar, boxData: nil, imageVideoList: nil, wideBarListData: $user.wideBarOne.wideBarListData, isEditMode: $isEditMode, geometry: geometry, wOne: 1, wTwo: 10, hOne: 0.13, hTwo: 5)
                    }
                    // Box 3
                    if isEditMode{
                        openView(.cardView, boxData: $user.boxThree, imageVideoList: $user.boxThree.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 1, wTwo: 10, hOne: 0.35, hTwo: 20)
                    }
                    else{
                        openView(.box, boxData: $user.boxThree, imageVideoList: $user.boxThree.imageVideoListData, wideBarListData: nil, isEditMode: $isEditMode, geometry: geometry, wOne: 1, wTwo: 10, hOne: 0.35, hTwo: 20)
                    }
                    
                }
                .toolbar {
                    if user.isEditable{
                        drawToolBar()
                    }
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
                    .cornerRadius(8)
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
                    .cornerRadius(8)
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
