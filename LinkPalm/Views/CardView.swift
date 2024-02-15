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
    @State var color = Color.gray
    
    @Binding var titleData : UserDesignModel
    
    @Binding var textBoxData : TextBoxDesignData
    
    @Binding var QRCodeModelList : QRCodeModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                NavigationLink(destination: BoxView(titleData: $titleData.boxOne.imageVideoListData)){
                    HStack {
                        WideBarView(color: .green)
                    }
                }
                
                HStack(spacing: 5) {
                    NavigationLink(destination: TextView(titleData: $titleData)){
                        QScreenTxtView(settings: $textObject)
                    }
                    .simultaneousGesture(TapGesture().onEnded { _ in
                        textObject.backgroundColor = .red
                        // Any pre-navigation action can be placed here
                    })
                        QScreenTxtView(settings: $test)

                }
                NavigationLink(destination: WideBarEditView(userDesign: $titleData.wideBarOne.wideBarListData)){
                    HStack {
                        WideBarListView(userDesign: $titleData.wideBarOne.wideBarListData)
                            .frame(height: 60)
                    }
                }
                //.padding(.top, 5)
                    HStack(spacing: 5) {
                        TextView(titleData: $titleData)
                            .frame(width: geometry.size.width * 0.6)
                    QScreenTxtView(settings: $test)
                        .frame(width: geometry.size.width * 0.4 - 15)
                }
                    HStack {
                        WideBarView(color: .green)
                    }
                    HStack(spacing: 5) {
                        QScreenTxtView(settings: $test)
                            .frame(height: geometry.size.height * 0.2)
                    }
                
            }
            .padding(5)
        }
    }
}

/*#Preview {
    TemplateOneView()
}*/
