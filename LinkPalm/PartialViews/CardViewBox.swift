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
            
            DrawSFSymbolForDesingBox(sfSymbolData: $boxData.boxDesign.sfSymbol)
            
            DynamicViewText(titleData: $boxData.boxDesign.text)
                .background(Color.clear)
                .offset(y: boxData.boxDesign.text.selectedXOffsetText)
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

struct CardViewDesignBox: View{
    
    @Binding var boxData: BoxData
    @Binding var userDesign: ImageVideoDataList
    @State var isIcon: Bool = true
    
    var body: some View{
        
        VStack{
            CardViewBox(boxData: $boxData, userDesign: $userDesign)
                .frame(height: 120)
                .clipped()
            
            drawToggleButtons(icon: "popcorn.circle", icon2: "textformat", title: "Icons", title2: "Text", toggleBool: $isIcon)
            
            ScrollView(showsIndicators: false){
                if !isIcon{
                    DrawTextFieldForWideBar(title: $boxData.boxDesign.text.text)
                    SliderDoubleView(minValue: 0, maxValue: 100, objectToChange: $boxData.boxDesign.text.selectedXOffsetText, title: EditImageString.xOffset)
                    configurateTextObjectsFontStyling(titleData: $boxData.boxDesign.text)
                    configurateTextObjectsFontColor(titleData: $boxData.boxDesign.text)
                }else{
                    DrawSFSymbolsChoices(selectedSFSymbol: $boxData.boxDesign.sfSymbol.sfIcon , title: headerTitleString.sfSymbolList.rawValue)
                    SliderDoubleView(minValue: 0, maxValue: 200, objectToChange: $boxData.boxDesign.sfSymbol.selectedSize , title: EditImageString.fontSize)
                    SliderDoubleView(minValue: 0, maxValue: 1, objectToChange: $boxData.boxDesign.sfSymbol.selectedFontOpacity , title: EditImageString.opacity)
                    SliderDoubleView(minValue: -100, maxValue: 100, objectToChange: $boxData.boxDesign.sfSymbol.selectedXOffsetIcon , title: EditImageString.xOffsetIcon)
                    DrawColorPaletteBox(selectedColor: $boxData.boxDesign.sfSymbol.selectedColorFont, title: headerTitleString.fontColor.rawValue)
                    
                }
                
                Divider()
                
                Button(action: {
                    
                }){
                    ButtonDesign(icon: "photo", title: "Image", borderColor: .black, borderThickness: 2, width: 150, height: 50)
                }

                drawSettingButtonForBackground(designData: $boxData.boxDesign.background)
            }
        }
        .padding()
    }
    
    
}

/*#Preview {
    CardViewBox()
}*/
