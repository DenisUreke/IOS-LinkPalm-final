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
    
    @Binding var titleData : UserDesignModel
    @Binding var QRCodeModelList : QRCodeModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                
                NavigationLink(destination: WideBarEditView(userDesign: $titleData.wideBarOne.wideBarListData)){
                    WideBarListView(userDesign: $titleData.wideBarOne.wideBarListData)
                        .frame(height: 60)
                }
                
                HStack(spacing: 5) {
                        QScreenTxtView(settings: $textObject)
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        textObject.backgroundColor = .red
                        // Any pre-navigation action can be placed here
                    })
                        QScreenTxtView(settings: $test)

                }
                NavigationLink(destination: WideBarEditView(userDesign: $titleData.wideBarTwo.wideBarListData)){
                        WideBarListView(userDesign: $titleData.wideBarTwo.wideBarListData)
                            .frame(height: 60)
                }
                    HStack(spacing: 5) {
                        BoxView(titleData: $titleData.boxThree.imageVideoListData)
                            .frame(width: geometry.size.width * 0.6)
                        QScreenTxtView(settings: $test)
                            .frame(width: geometry.size.width * 0.4 - 15)
                }
                NavigationLink(destination: isEditMode ? WideBarEditView(userDesign: $titleData.wideBarThree.wideBarListData) : WideBarEditView(userDesign: $titleData.wideBarThree.wideBarListData)){
                        WideBarListView(userDesign: $titleData.wideBarThree.wideBarListData)
                            .frame(height: 60)
                    }
                    HStack(spacing: 5) {
                        QScreenTxtView(settings: $test)
                            .frame(height: geometry.size.height * 0.2)
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
                 }
                 NavigationLink(destination: configurateTextObjects(titleData: $titleData.boxOne.textBoxDesignData.TextBoxDesign.text)){
                 Label("Design Text", systemImage: "textformat")
                 }*/
                /*NavigationLink(destination: BackgroundEditView(titleData: $titleData.boxOne.textBoxDesignData.backgroundData)){
                 Label("Design Background", systemImage: "paintpalette")
                 }*/
                /*NavigationLink(destination: PhotoView(userDesignModel: $titleData, viewToShow: ViewPassedIntoPhotoSelector.textView, imageData: $titleData.boxOne.textBoxDesignData.backgroundData.imageData)) {
                 Label("Insert Image", systemImage: "photo")
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
