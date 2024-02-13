//
//  ImageVideoListView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import SwiftUI

struct BoxView: View {
    
    @Binding var titleData : UserDesignModel
    
    var body: some View {
        VStack(spacing: 0){
            ImageVideoListView(list: titleData.boxOne.imageVideoListData , designData: $titleData)
        }
        .padding(.horizontal, -20) 
        .border(titleData.boxOne.textBoxDesignData.backgroundData.selectedBorderColor.color, width: titleData.boxOne.textBoxDesignData.backgroundData.selectedBorderWidth)
        .background(titleData.boxOne.textBoxDesignData.backgroundData.gradientIsClicked ? Gradient(colors: [titleData.boxOne.textBoxDesignData.backgroundData.selectedColorBackgroundOne.color, titleData.boxOne.textBoxDesignData.backgroundData.selectedColorBackgroundTwo.color]).opacity(titleData.boxOne.textBoxDesignData.backgroundData.selectedBackgroundOpacity) : Gradient(colors: [titleData.boxOne.textBoxDesignData.backgroundData.selectedColorBackgroundOne.color, titleData.boxOne.textBoxDesignData.backgroundData.selectedColorBackgroundOne.color]).opacity(titleData.boxOne.textBoxDesignData.backgroundData.selectedBackgroundOpacity) )
        
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
    @Binding var designData : UserDesignModel
    
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
    case .title:
        return AnyView(DynamicViewTitle(titleData: imageVideoData.textCustomModel))
    case .text:
        return AnyView(DynamicViewText(titleData: imageVideoData.textCustomModel))
    case .video:
        return AnyView(LoadVideoView(ID: imageVideoData.videoID))
    case .picture:
        return AnyView(DynamicPictureView(imageData: imageVideoData.imageData))
    case .picturefromweb:
        return AnyView(DynamicPictureViewFromWeb(imageData: imageVideoData))
    }
}


struct DynamicViewTitle: View {
    
    let titleData : TitleCustomModel
    
    var body: some View {
        
        VStack{
            Text("\(titleData.title)")
                .frame(maxWidth: .infinity, alignment: titleData.selectedAlignment.getAlignment)
        }
        .font(.system(size: titleData.selectedSize, weight: titleData.selectedWeight.getWeight, design: titleData.selectedStyle.getFontStyel))
        .opacity(titleData.selectedFontOpacity)
        .foregroundColor(titleData.selectedColorFont.color)
        .frame(maxWidth: .infinity, maxHeight: 80, alignment: .center)
        .shadow(color: !titleData.shadowIsClicked ? .clear : .gray,
                radius: 2,x: 0, y: !titleData.shadowIsClicked ? 0 : 5)
        .border(titleData.selectedBorderColor.color, width: titleData.selectedBorderWidth)
        
        .background(titleData.gradientIsClicked ? Gradient(colors: [titleData.selectedColorBackground.color, titleData.selectedColorBackgroundTwo.color]).opacity(titleData.selectedBackgroundOpacity) : Gradient(colors: [titleData.selectedColorBackground.color, titleData.selectedColorBackground.color]).opacity(titleData.selectedBackgroundOpacity) )
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
        }
    }
}

struct DynamicPictureView: View {
    
    let imageData : ImageData

    var body: some View {
        if let image = imageData.selectedBackgroundImage{
            image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .opacity(imageData.selectedOpacity)
                .saturation(imageData.selectedSaturation)
                .contrast(imageData.selectedContrast)
        }else{Text("Could not find Image")}
    }
}

struct DynamicPictureViewFromWeb: View {
    let imageData: ImageVideoData

    var body: some View {
        AsyncImage(url: imageData.imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .opacity(imageData.imageData.selectedOpacity)
                    .saturation(imageData.imageData.selectedSaturation)
                    .contrast(imageData.imageData.selectedContrast)
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
