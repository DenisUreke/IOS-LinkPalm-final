//
//  TemplateOneView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import SwiftUI

struct CardView: View {
    
    @State var textObject = QScreenTxtModel()
    @State var test = QScreenTxtModel()
    @State var isEditMode: Bool = false
    
    @State var testing = UserDesignList()
    @Binding var user : UserDesignModel
    @Binding var QRCodeModelList : QRCodeModel
    
    var body: some View {
        
        GeometryReader{ geometry in
            VStack(spacing: 5) {
                
                //WideBar 1
                if isEditMode{
                    NavigationLink(destination: WideBarEditView(userDesign: $user.wideBarOne.wideBarListData)){
                        WideBarListView(userDesign: $user.wideBarOne.wideBarListData)
                            .frame(width: (geometry.size.width * 1) - 10, height: (geometry.size.height * 0.1) - 5)
                    }
                }else{
                    WideBarListView(userDesign: $user.wideBarOne.wideBarListData)
                        .frame(height: 60)
                }
                // Box 1, 2
                HStack(spacing: 5) {
                    if isEditMode{
                        NavigationLink(destination: CardViewDesignBox(boxData: $user.boxOne, userDesign: $user.boxOne.imageVideoListData)){
                            CardViewBox(boxData: $user.boxOne, userDesign: $user.boxOne.imageVideoListData)
                                .frame(width: (geometry.size.width * 0.6) - 15, height: (geometry.size.height * 0.25) - 15)
                                .fixedSize()
                                .clipped()
                        }
                    }
                    else{
                        NavigationLink(destination: BoxView(titleData: $user.boxOne.imageVideoListData)){
                            CardViewBox(boxData: $user.boxOne, userDesign: $user.boxOne.imageVideoListData)
                                .frame(width: (geometry.size.width * 0.6) - 15, height: (geometry.size.height * 0.25) - 15)
                                .fixedSize()
                                .clipped()
                        }
                    }
                    if isEditMode{
                        NavigationLink(destination: CardViewDesignBox(boxData: $user.boxTwo, userDesign: $user.boxTwo.imageVideoListData)){
                            CardViewBox(boxData: $user.boxTwo, userDesign: $user.boxTwo.imageVideoListData)
                                .frame(width: geometry.size.width * 0.4, height: (geometry.size.height * 0.25) - 15)
                                .fixedSize()
                                .clipped()
                        }
                    }
                    else{
                        NavigationLink(destination: BoxView(titleData: $user.boxTwo.imageVideoListData)){
                            CardViewBox(boxData: $user.boxTwo, userDesign: $user.boxTwo.imageVideoListData)
                                .frame(width: geometry.size.width * 0.4, height: (geometry.size.height * 0.25) - 15)
                                .fixedSize()
                                .clipped()
                        }
                    }
                }
                // WideBar 2
                NavigationLink(destination: WideBarEditView(userDesign: $user.wideBarTwo.wideBarListData)){
                    WideBarListView(userDesign: $user.wideBarTwo.wideBarListData)
                        .frame(width: (geometry.size.width * 1) - 10, height: (geometry.size.height * 0.1) - 5)
                }
                // Box 3, 4
                HStack(spacing: 5) {
                    if isEditMode{
                        NavigationLink(destination: CardViewDesignBox(boxData: $user.boxThree, userDesign: $user.boxThree.imageVideoListData)){
                            CardViewBox(boxData: $user.boxThree, userDesign: $user.boxThree.imageVideoListData)
                                .frame(width: (geometry.size.width * 0.5) - 7.5, height: (geometry.size.height * 0.25) - 15 )
                                .fixedSize()
                                .clipped()
                        }
                    }
                    else{
                        NavigationLink(destination: BoxView(titleData: $user.boxThree.imageVideoListData)){
                            CardViewBox(boxData: $user.boxThree, userDesign: $user.boxThree.imageVideoListData)
                                .frame(width: (geometry.size.width * 0.5) - 7.5, height: (geometry.size.height * 0.25) - 15 )
                                .fixedSize()
                                .clipped()
                        }
                    }
                    if isEditMode{
                        NavigationLink(destination: CardViewDesignBox(boxData: $user.boxFour, userDesign: $user.boxFour.imageVideoListData)){
                            CardViewBox(boxData: $user.boxFour, userDesign: $user.boxFour.imageVideoListData)
                                .frame(width: (geometry.size.width * 0.5) - 7.5, height: (geometry.size.height * 0.25) - 15 )
                                .fixedSize()
                                .clipped()
                        }
                    }
                    else{
                        NavigationLink(destination: BoxView(titleData: $user.boxFour.imageVideoListData)){
                            CardViewBox(boxData: $user.boxFour, userDesign: $user.boxFour.imageVideoListData)
                                .frame(width: (geometry.size.width * 0.5) - 7.5, height: (geometry.size.height * 0.25) - 15 )
                                .fixedSize()
                                .clipped()
                        }
                    }
                }
                //WideBar 3
                NavigationLink(destination: isEditMode ? WideBarEditView(userDesign: $user.wideBarThree.wideBarListData) : WideBarEditView(userDesign: $user.wideBarThree.wideBarListData)){
                    WideBarListView(userDesign: $user.wideBarThree.wideBarListData)
                        .frame(width: (geometry.size.width * 1) - 10, height: (geometry.size.height * 0.1) - 5)
                }
                // Box 5
                if isEditMode{
                    NavigationLink(destination: CardViewDesignBox(boxData: $user.boxFive, userDesign: $user.boxFive.imageVideoListData)){
                        CardViewBox(boxData: $user.boxFive, userDesign: $user.boxFive.imageVideoListData)
                            .frame(width: (geometry.size.width * 1) - 10, height: (geometry.size.height * 0.25) - 15)
                            .fixedSize()
                            .clipped()
                    }
                }
                else{
                    NavigationLink(destination: BoxView(titleData: $user.boxFive.imageVideoListData)){
                        CardViewBox(boxData: $user.boxFive, userDesign: $user.boxFive.imageVideoListData)
                            .frame(width: (geometry.size.width * 1) - 10, height: (geometry.size.height * 0.25) - 15)
                            .fixedSize()
                            .clipped()
                    }
                }
                
            }
            .toolbar {
                drawToolBar()
            }
            .padding(5)
        }
    }
    private func drawToolBar()-> some ToolbarContent{
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            Menu {
                Button(action: {
                    self.isEditMode.toggle()
                }) {
                    Label(isEditMode ? "Exit Edit Mode" : "Edit Mode", systemImage: isEditMode ? "xmark.circle" : "square.and.pencil")
                }
                Button("Save", action: {
                    // Your save action here
                })
            } label: {
                Label("Menu", systemImage: "line.3.horizontal")
            }
        }
    }
}

/*Button(action:{
    testing.createAndPopulateUserDesign()
}){
    ButtonDesign(icon: "person", title: "test", borderColor: .blue, borderThickness: 2, width: 180, height: 60)
}

#Preview {
    TemplateOneView()
}*/
