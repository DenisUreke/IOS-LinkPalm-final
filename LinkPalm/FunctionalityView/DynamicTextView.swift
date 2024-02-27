//
//  DynamicTectView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-27.
//

import SwiftUI

struct DynamicViewText: View {
    
    @Binding var titleData : TitleCustomModel
    
    var body: some View {
        
        //ScrollView{
            VStack{
                Text("\(titleData.data.text)")
                    .frame(maxWidth: .infinity, alignment: titleData.data.selectedAlignment.getAlignment)
                    .multilineTextAlignment(titleData.data.selectedTextAlignment.getTextAlignment)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .font(.system(size: titleData.data.selectedSize, weight: titleData.data.selectedWeight.getWeight, design: titleData.data.selectedStyle.getFontStyel))
            .opacity(titleData.data.selectedFontOpacity)
            .offset(y: titleData.data.selectedXOffsetText)
            .foregroundColor(titleData.data.selectedColorFont.color)
            .shadow(color: !titleData.data.shadowIsClicked ? .clear : .gray,
                    radius: 2,x: 0, y: !titleData.data.shadowIsClicked ? 0 : 5)
            .border(titleData.data.selectedBorderColor.color, width: titleData.data.selectedBorderWidth)
            
            .background(titleData.data.gradientIsClicked ? Gradient(colors: [titleData.data.selectedColorBackground.color, titleData.data.selectedColorBackgroundTwo.color]).opacity(titleData.data.selectedBackgroundOpacity) : Gradient(colors: [titleData.data.selectedColorBackground.color, titleData.data.selectedColorBackground.color]).opacity(titleData.data.selectedBackgroundOpacity) )
            .cornerRadius(titleData.data.selectedCornerRadius)
        //}
    }
}
