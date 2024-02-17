//
//  CardViewBox.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-15.
//

import SwiftUI

//enum XOffsetTextEnum

struct CardViewBox: View {
    
    @Binding var boxData: BoxData
    @Binding var userDesign: ImageVideoDataList
    
    var body: some View {
        ZStack {

            DrawBackGroundForBoxDesign(backgroundDesign: $boxData.boxDesign.background)
            
            
            if boxData.boxDesign.imageVideoData.typeOfBox == ImageVideoEnum.picture {DynamicPictureView(imageData: $boxData.boxDesign.imageVideoData)
            }
            if let url = boxData.boxDesign.imageVideoData.imageData.imageURL, !url.path.isEmpty {
                DynamicPictureViewFromWeb(imageData: $boxData.boxDesign.imageVideoData)
            }
            DrawSFSymbolForDesingBox(sfSymbolData: $boxData.boxDesign.sfSymbol)
            
            DynamicViewText(titleData: $boxData.boxDesign.text)
        }
        .clipped()
    }
}

struct DrawSFSymbolForDesingBox: View{
    
    @Binding var sfSymbolData: SFSymbolData
    
    var body: some View{
        
        Image(systemName: sfSymbolData.sfIcon.rawValue)
            .foregroundColor(sfSymbolData.selectedColorFont.color.opacity(sfSymbolData.selectedFontOpacity))
            .font(.system(size: sfSymbolData.selectedSize))
            .offset(y: sfSymbolData.selectedXOffsetIcon)
        
    }
}

struct DrawBackGroundForBoxDesign: View{
    
    @Binding var backgroundDesign: BackgroundData
    
    var body: some View{
        Rectangle()
            .fill(backgroundDesign.gradientIsClicked ? LinearGradient(gradient: Gradient(colors: [backgroundDesign.selectedColorBackgroundOne.color, backgroundDesign.selectedColorBackgroundTwo.color]), startPoint: .top, endPoint: .bottom) : LinearGradient(gradient: Gradient(colors: [backgroundDesign.selectedColorBackgroundOne.color, backgroundDesign.selectedColorBackgroundOne.color]), startPoint: .top, endPoint: .bottom))
            .opacity(backgroundDesign.selectedBackgroundOpacity)
            .border(backgroundDesign.selectedBorderColor.color, width: backgroundDesign.selectedBorderWidth)
            .cornerRadius(backgroundDesign.selectedCornerRadius)
    }
}

/*#Preview {
    CardViewBox()
}*/
