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
            ImageVideoListView(list: titleData)
        }
        .padding(.horizontal, -20) 
        .border(titleData.backgroundData.selectedBorderColor.color, width: titleData.backgroundData.selectedBorderWidth)
        .background(titleData.backgroundData.gradientIsClicked ? Gradient(colors: [titleData.backgroundData.selectedColorBackgroundOne.color, titleData.backgroundData.selectedColorBackgroundTwo.color]).opacity(titleData.backgroundData.selectedBackgroundOpacity) : Gradient(colors: [titleData.backgroundData.selectedColorBackgroundOne.color, titleData.backgroundData.selectedColorBackgroundOne.color]).opacity(titleData.backgroundData.selectedBackgroundOpacity) )
        .cornerRadius(titleData.backgroundData.selectedCornerRadius)
        
        NavigationLink(destination: BoxDesignView(designData: $titleData)){

                Text("Edit")
                    .frame(width: 200)
                    .font(.system(size: 18))
                    .foregroundColor(Color.white)
                    .padding(8)
                    .background(Color.blue)
                    .border(.black, width: 1)
                    .cornerRadius(10)
        }
        
        /*if titleData.isEditMode{
            BoxDesignButton(viewToNavigate: BoxDesignView(designData: $titleData), buttonText: "testing")
        }*/
    }
    
    
}

struct ImageVideoListView: View {
    
    var list : ImageVideoDataList
    
    var body: some View {
        List {
            ForEach(list.listOfEntries) { entry in
                getDynamicView(imageVideoData: entry, type: entry.typeOfBox)
            }
        }
    }
}


func getDynamicView(imageVideoData: ImageVideoData, type: ImageVideoEnum) -> some View {
    
    switch type {
    case .none:
        return AnyView(EmptyView())
    case .text:
        return AnyView(DynamicViewText(titleData: imageVideoData.textCustomModel))
    case .video:
        return AnyView(LoadVideoView(ID: imageVideoData.videoID))
    case .picture:
        return AnyView(DynamicPictureView(imageData: imageVideoData))
    case .picturefromweb:
        return AnyView(DynamicPictureViewFromWeb(imageData: imageVideoData))
    }
}

struct DynamicViewText: View {
    
    let titleData : TitleCustomModel
    
    var body: some View {
        
        ScrollView{
            VStack{
                Text("\(titleData.text)")
                    .frame(maxWidth: .infinity, alignment: titleData.selectedAlignment.getAlignment)
                    .multilineTextAlignment(titleData.selectedTextAlignment.getTextAlignment)
                    .padding([.leading, .trailing], 10)
                Spacer()
            }
            .font(.system(size: titleData.selectedSize, weight: titleData.selectedWeight.getWeight, design: titleData.selectedStyle.getFontStyel))
            .opacity(titleData.selectedFontOpacity)
            .foregroundColor(titleData.selectedColorFont.color)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .shadow(color: !titleData.shadowIsClicked ? .clear : .gray,
                    radius: 2,x: 0, y: !titleData.shadowIsClicked ? 0 : 5)
            .border(titleData.selectedBorderColor.color, width: titleData.selectedBorderWidth)
            
            .background(titleData.gradientIsClicked ? Gradient(colors: [titleData.selectedColorBackground.color, titleData.selectedColorBackgroundTwo.color]).opacity(titleData.selectedBackgroundOpacity) : Gradient(colors: [titleData.selectedColorBackground.color, titleData.selectedColorBackground.color]).opacity(titleData.selectedBackgroundOpacity) )
            .cornerRadius(titleData.selectedCornerRadius)
        }
    }
}

struct DynamicPictureView: View {
    
    let imageData : ImageVideoData

    var body: some View {
        if let image = imageData.imageData.selectedBackgroundImage{
            image
                .resizable()
                .scaledToFit()
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
    
    let imageData: ImageVideoData

    var body: some View {
        AsyncImage(url: imageData.imageData.imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
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
