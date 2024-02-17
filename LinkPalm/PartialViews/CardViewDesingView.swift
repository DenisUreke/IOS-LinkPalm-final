//
//  CardViewDesingView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-17.
//

import SwiftUI

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

                drawSettingButtonForBackground(designData: $boxData.boxDesign.background)
                
                NavigationLink(destination: PhotoView(designData: $boxData.boxDesign.imageVideoData)){
                    VStack{
                        ButtonDesign(icon: "photo", title: "Image", borderColor: .black, borderThickness: 2, width: 150, height: 50)
                    }
                }
            }
        }
        .padding()
    }
    
    
}
