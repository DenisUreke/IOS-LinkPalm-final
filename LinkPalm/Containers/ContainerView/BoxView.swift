//
//  ImageVideoListView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import SwiftUI

struct BoxView: View {
    
    @Binding var titleData : ImageVideoDataList
    
    var body: some View {
        VStack(spacing: 0){
            ImageVideoListView(list: $titleData)
        }
        .padding(.horizontal, -20) 
        .border(titleData.backgroundData.selectedBorderColor.color, width: titleData.backgroundData.selectedBorderWidth)
        .background(titleData.backgroundData.gradientIsClicked ? Gradient(colors: [titleData.backgroundData.selectedColorBackgroundOne.color, titleData.backgroundData.selectedColorBackgroundTwo.color]).opacity(titleData.backgroundData.selectedBackgroundOpacity) : Gradient(colors: [titleData.backgroundData.selectedColorBackgroundOne.color, titleData.backgroundData.selectedColorBackgroundOne.color]).opacity(titleData.backgroundData.selectedBackgroundOpacity) )
        .cornerRadius(titleData.backgroundData.selectedCornerRadius)
        
        /*NavigationLink(destination: BoxDesignView(designData: $titleData)){

                Text("Edit")
                    .frame(width: 200)
                    .font(.system(size: 18))
                    .foregroundColor(Color.white)
                    .padding(8)
                    .background(Color.blue)
                    .border(.black, width: 1)
                    .cornerRadius(10)
        }*/
    }
}

struct ImageVideoListView: View {
    
    @Binding var list : ImageVideoDataList
    
    var body: some View {
        List {
            ForEach(Array(list.listOfEntries.enumerated()), id: \.element.id) { index, entry in
                VStack{
                    getDynamicView(imageVideoData: $list.listOfEntries[index], type: entry.typeOfBox)
                        .background(list.backgroundData.gradientIsClicked ? Gradient(colors: [list.backgroundData.selectedColorBackgroundOne.color, list.backgroundData.selectedColorBackgroundTwo.color]).opacity(list.backgroundData.selectedBackgroundOpacity) : Gradient(colors: [list.backgroundData.selectedColorBackgroundOne.color, list.backgroundData.selectedColorBackgroundOne.color]).opacity(list.backgroundData.selectedBackgroundOpacity) )
                        .listRowBackground(list.backgroundData.selectedColorBackgroundOne.color)
                    
                    /*Button(action: {
                        if let atIndex = list.listOfEntries.firstIndex(where: { $0.id == entry.id }) {
                            list.listOfEntries.remove(at: atIndex)
                        }
                    })
                    {
                        ButtonDesign(icon: "trash.square", title: "Delete", borderColor: .black, borderThickness: 2)
                    }*/
                    
                    //DynamicButtonForEditing(list: $list, current: $list.listOfEntries[index])
                }
            }
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
    
    @Binding var list: ImageVideoDataList
    @Binding var current: ImageVideoData
    @State private var currentState: ViewState = .viewD
    
    var body: some View {
        
        VStack {

            Button(action: {
                switch current.typeOfBox {
                case .none:
                    currentState = .viewD
                case .picture, .picturefromweb:
                    currentState = .viewA
                case .text:
                    currentState = .viewB
                case .video:
                    currentState = .viewC
                }
            })
            {
                ButtonDesign(icon: "square.and.pencil", title: "Edit", borderColor: .black, borderThickness: 2, width: 180, height:50)
            }
            Text("\(current.typeOfBox.rawValue)")
            getView(for: currentState)
        }
    }
    
    @ViewBuilder
    func getView(for state: ViewState) -> some View {
        switch state {
        case .viewA:
            PhotoView(designData: $current)
        case .viewB:
            Text("View B") // Replace with your actual view
        case .viewC:
            VideoDesignView(designData: $current)
        case .viewD:
            Text("View D") // Assume a new case for `.none`
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

struct DynamicPictureView: View {
    
    @Binding var imageData : ImageVideoData

    var body: some View {
        if let image = imageData.imageData.selectedBackgroundImage{
            image
                .resizable()
                .scaledToFit()
                .scaleEffect(imageData.imageData.selectedScale)
                .offset(x: imageData.imageData.selectedXAxisOffset, y: imageData.imageData.selectedYAxisOffset)
                .clipShape(RoundedRectangle(cornerRadius: imageData.textCustomModel.selectedImageCornerRadius))
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(imageData.imageData.selectedRotation))
                .hueRotation(.degrees(imageData.imageData.selectedHueRotation))
                .opacity(imageData.imageData.selectedOpacity)
                .saturation(imageData.imageData.selectedSaturation)
                .contrast(imageData.imageData.selectedContrast)
                .border(imageData.textCustomModel.selectedBorderColor.color, width: imageData.textCustomModel.selectedBorderWidth)
                .overlay(
                    RoundedRectangle(cornerRadius: imageData.textCustomModel.selectedImageCornerRadius)
                        .stroke(imageData.textCustomModel.selectedBorderColor.color, lineWidth: imageData.textCustomModel.selectedBorderWidth)
                )
        }else{Text("Could not find Image")}
    }
}

struct DynamicPictureViewFromWeb: View {
    
    @Binding var imageData: ImageVideoData

    var body: some View {
        AsyncImage(url: imageData.imageData.imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(imageData.imageData.selectedScale)
                    .offset(x: imageData.imageData.selectedXAxisOffset, y: imageData.imageData.selectedYAxisOffset)
                    .clipShape(RoundedRectangle(cornerRadius: imageData.textCustomModel.selectedImageCornerRadius))
                    .frame(maxWidth: .infinity)
                    .rotationEffect(.degrees(imageData.imageData.selectedRotation))
                    .hueRotation(.degrees(imageData.imageData.selectedHueRotation))
                    .opacity(imageData.imageData.selectedOpacity)
                    .saturation(imageData.imageData.selectedSaturation)
                    .contrast(imageData.imageData.selectedContrast)
                    .border(imageData.textCustomModel.selectedBorderColor.color, width: imageData.textCustomModel.selectedBorderWidth)
                    .cornerRadius(imageData.textCustomModel.selectedCornerRadius)
            case .failure:
                Text("Unable to load image")
            @unknown default:
                EmptyView()
            }
        }
    }
}








/*#Preview {
    ImageVideoListView()
}*/
