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
    
    @Binding var user : UserDesignModel
    @Binding var QRCodeModelList : QRCodeModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                
                //WideBar 1
                if isEditMode{
                    NavigationLink(destination: WideBarEditView(userDesign: $user.wideBarOne.wideBarListData)){
                        WideBarListView(userDesign: $user.wideBarOne.wideBarListData)
                            .frame(height: 60)
                    }
                }else{
                    WideBarListView(userDesign: $user.wideBarOne.wideBarListData)
                }
                
                //Box 1, 2
                HStack(spacing: 5) {
                    NavigationLink(destination: BoxView(titleData: $user.boxOne.imageVideoListData)){
                        CardViewBox(boxData: $user.boxOne, userDesign: $user.boxOne.imageVideoListData)
                        .simultaneousGesture(TapGesture().onEnded { _ in
                            textObject.backgroundColor = .red
                        })
                    QScreenTxtView(settings: $test)
                    
                }
            }
                NavigationLink(destination: WideBarEditView(userDesign: $user.wideBarTwo.wideBarListData)){
                        WideBarListView(userDesign: $user.wideBarTwo.wideBarListData)
                            .frame(height: 60)
                }
                    HStack(spacing: 5) {
                        BoxView(titleData: $user.boxOne.imageVideoListData)
                            .frame(width: geometry.size.width * 0.6)
                        NavigationLink(destination: BoxDesignView(designData: $user.boxOne.imageVideoListData)){
                            QScreenTxtView(settings: $test)
                                .frame(width: geometry.size.width * 0.4 - 15)
                        }
                }
                NavigationLink(destination: isEditMode ? WideBarEditView(userDesign: $user.wideBarThree.wideBarListData) : WideBarEditView(userDesign: $user.wideBarThree.wideBarListData)){
                        WideBarListView(userDesign: $user.wideBarThree.wideBarListData)
                            .frame(height: 60)
                    }
                NavigationLink(destination: CardViewDesignBox(boxData: $user.boxOne, userDesign: $user.boxOne.imageVideoListData)){
                    HStack(spacing: 5) {
                        CardViewBox(boxData: $user.boxOne, userDesign: $user.boxOne.imageVideoListData)
                            .frame(height: geometry.size.height * 0.2)
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
                    self.isEditMode
                        .toggle()
                }) {
                    Label("Design Mode", systemImage: "paintpalette")
                }
                /*NavigationLink(destination: configurateTextObjects(titleData: $titleData.boxOne.textBoxDesignData.TextBoxDesign.title)){
                 Label("Design Header", systemImage: "header")
                 }*/
                Button("Save", action: {
                    // Your save action here
                })
            } label: {
                Label("Menu", systemImage: "line.3.horizontal")
            }
        }
    }
}

/*#Preview {
    TemplateOneView()
}*/
