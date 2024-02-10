//
//  BackgroundEditView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import SwiftUI

struct BackgroundEditView: View {
    
    @Binding var titleData : BackgroundData
    
    var body: some View {

        VStack {
            ZStack{
                VStack{

                }
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                .border(titleData.selectedBorderColor.color, width: titleData.selectedBorderWidth)
            }
            .background(titleData.gradientIsClicked ? Gradient(colors: [titleData.selectedColorBackgroundOne.color, titleData.selectedColorBackgroundTwo.color]).opacity(titleData.selectedBackgroundOpacity) : Gradient(colors: [titleData.selectedColorBackgroundOne.color, titleData.selectedColorBackgroundOne.color]).opacity(titleData.selectedBackgroundOpacity) )
            
            Divider()
        }
        ScrollView{
            
            DrawColorPaletteBox(selectedColor: $titleData.selectedColorBackgroundOne, title: headerTitleString.backgroundColor.rawValue)
            
            VStack{
                Text("Gradient")
                Image(systemName: !titleData.gradientIsClicked ? "square" : "square.fill")
                    .font(.system(size: 18))
                VStack {
                    Slider(value: $titleData.selectedBackgroundOpacity, in: 0...1)
                        .padding()
                }
            }
            .onTapGesture {
                titleData.gradientIsClicked.toggle()
            }
            if titleData.gradientIsClicked {
                DrawColorPaletteBox(selectedColor: $titleData.selectedColorBackgroundTwo, title: headerTitleString.backgroundColorsRadient.rawValue)
            }
            Divider()
            DrawColorPaletteBox(selectedColor: $titleData.selectedBorderColor, title: headerTitleString.setBorderColor.rawValue)
            Slider(value: $titleData.selectedBorderWidth, in: 0...20)
            
        }
        
    }
}

/*#Preview {
    BackgroundEditView()
}*/
