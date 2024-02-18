//
//  ImageVideoListView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import SwiftUI

struct BoxView: View {
    
    @Binding var titleData : ImageVideoDataList
    @State var isEditMode : Bool = false
    
    var body: some View {
        VStack(spacing: 0){
            ImageVideoListView(list: $titleData, isEditMode: $isEditMode)
        }
        .padding(.horizontal, -20) 
        .border(titleData.backgroundData.selectedBorderColor.color, width: titleData.backgroundData.selectedBorderWidth)
        .background(titleData.backgroundData.gradientIsClicked ? Gradient(colors: [titleData.backgroundData.selectedColorBackgroundOne.color, titleData.backgroundData.selectedColorBackgroundTwo.color]).opacity(titleData.backgroundData.selectedBackgroundOpacity) : Gradient(colors: [titleData.backgroundData.selectedColorBackgroundOne.color, titleData.backgroundData.selectedColorBackgroundOne.color]).opacity(titleData.backgroundData.selectedBackgroundOpacity) )
        .cornerRadius(titleData.backgroundData.selectedCornerRadius)
        .toolbar {
            drawToolBar()
        }
        
        if isEditMode{
            NavigationLink(destination: BoxDesignView(designData: $titleData)){
                ButtonDesign(icon: "plus.app", title: "Add", borderColor: .black, borderThickness: 2, width: 180, height: 50)
            }
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
            } label: {
                Label("Menu", systemImage: "line.3.horizontal")
            }
        }
    }
}

struct ImageVideoListView: View {
    
    @Binding var list : ImageVideoDataList
    @Binding var isEditMode : Bool
    
    var body: some View {
        List {
            ForEach(Array(list.listOfEntries.enumerated()), id: \.element.id) { index, entry in
                VStack{
                    getDynamicView(imageVideoData: $list.listOfEntries[index], type: entry.typeOfBox)
                        .background(list.backgroundData.gradientIsClicked ? Gradient(colors: [list.backgroundData.selectedColorBackgroundOne.color, list.backgroundData.selectedColorBackgroundTwo.color]).opacity(list.backgroundData.selectedBackgroundOpacity) : Gradient(colors: [list.backgroundData.selectedColorBackgroundOne.color, list.backgroundData.selectedColorBackgroundOne.color]).opacity(list.backgroundData.selectedBackgroundOpacity) )
                
                    }
                if isEditMode{
                    HStack{
                        Button(action: {
                            if let atIndex = list.listOfEntries.firstIndex(where: { $0.id == entry.id }) {
                                list.listOfEntries.remove(at: atIndex)
                            }
                        })
                        {
                            ButtonDesign(icon: "trash.square", title: "Delete", borderColor: .black, borderThickness: 2, width: 180, height: 50)
                        }
                        
                        /*if let atIndex = list.listOfEntries.firstIndex(where: { $0.id == entry.id }) {
                            Text("TESTING!!!! \(list.listOfEntries[atIndex].textCustomModel.selectedSize)")
                            DynamicButtonForEditing(data: $list.listOfEntries[atIndex])
                        }*/
                    }
                }
            }
            .listRowBackground(list.backgroundData.selectedColorBackgroundOne.color)
        }
    }
    
}


func getDynamicView(imageVideoData: Binding<ImageVideoData>, type: ImageVideoEnum) -> some View {
    
    switch type {
    case .none:
        return AnyView(EmptyView())
    case .text:
        return AnyView(DynamicViewText(titleData: imageVideoData.textCustomModel))
    case .video:
        return AnyView(LoadVideoView(ID: imageVideoData.videoID.wrappedValue))
    case .picture:
        return AnyView(DynamicPictureView(imageData: imageVideoData))
    case .picturefromweb:
        return AnyView(DynamicPictureViewFromWeb(imageData: imageVideoData))
    }
}

enum ViewState {
    case viewA
    case viewB
    case viewC
    case viewD
}

struct DynamicButtonForEditing: View {
    
    @Binding var data: ImageVideoData
    @State private var currentState: ViewState = .viewD
    
    var body: some View {
        
        VStack {

            Button(action: {
                
                switch data.typeOfBox {
                case .none:
                    currentState = .viewD
                case .picture, .picturefromweb:
                    currentState = .viewA
                case .text:
                    currentState = .viewB
                case .video:
                    currentState = .viewC
                }
            }) {
                ButtonDesign(icon: "square.and.pencil", title: "Edit", borderColor: .black, borderThickness: 2, width: 180, height:50)
            }
            getView(for: currentState)
        }
    }
    
    @ViewBuilder
    private func getView(for state: ViewState) -> some View {
        switch state {
        case .viewA:
            PhotoView(designData: $data)
        case .viewB:
            Text("Text Editing View") // Placeholder for your text editing view
        case .viewC:
            VideoDesignView(designData: $data)
        case .viewD:
            EmptyView() // Placeholder for a default or empty state view
        }
    }
}

/*
 if let specificItem = list.listOfEntries.firstIndex(where: id == entry.id){
     // Use `specificItem`
 }
 
 Button("Button \(entry.id)") {
     // Action for the button, possibly navigating or performing an operation with entry.id
     print("Button tapped for item with ID: \(entry.id)")
 }
 */


struct DynamicViewText: View {
    
    @Binding var titleData : TitleCustomModel
    
    var body: some View {
        
        //ScrollView{
            VStack{
                Text("\(titleData.text)")
                    .frame(maxWidth: .infinity, alignment: titleData.selectedAlignment.getAlignment)
                    .multilineTextAlignment(titleData.selectedTextAlignment.getTextAlignment)
                    .padding([.leading, .trailing], 10)
                Spacer()
            }
            .font(.system(size: titleData.selectedSize, weight: titleData.selectedWeight.getWeight, design: titleData.selectedStyle.getFontStyel))
            .opacity(titleData.selectedFontOpacity)
            .offset(y: titleData.selectedXOffsetText)
            .foregroundColor(titleData.selectedColorFont.color)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .shadow(color: !titleData.shadowIsClicked ? .clear : .gray,
                    radius: 2,x: 0, y: !titleData.shadowIsClicked ? 0 : 5)
            .border(titleData.selectedBorderColor.color, width: titleData.selectedBorderWidth)
            
            .background(titleData.gradientIsClicked ? Gradient(colors: [titleData.selectedColorBackground.color, titleData.selectedColorBackgroundTwo.color]).opacity(titleData.selectedBackgroundOpacity) : Gradient(colors: [titleData.selectedColorBackground.color, titleData.selectedColorBackground.color]).opacity(titleData.selectedBackgroundOpacity) )
            .cornerRadius(titleData.selectedCornerRadius)
        //}
    }
}







/*#Preview {
    ImageVideoListView()
}*/
