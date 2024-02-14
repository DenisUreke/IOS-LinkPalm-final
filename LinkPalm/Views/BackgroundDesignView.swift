//
//  BackgroundDesignView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-14.
//

import SwiftUI

struct BackgroundDesignView: View {
    @Binding var designData: BackgroundData
    
    var body: some View {
        
        drawVisualFrameBackGround(designData: $designData)
        
        Divider()
        
        ScrollView(showsIndicators: false){
            
            drawSettingButtonForBackground(designData: $designData)
        }
    }
}

struct drawVisualFrameBackGround: View{
    @Binding var designData: BackgroundData
    
    var body: some View{
        VStack{
            
        }
        .frame(width: 300, height: 100)
        .border(designData.selectedBorderColor.color, width: designData.selectedBorderWidth)
        .background(designData.gradientIsClicked ? Gradient(colors: [designData.selectedColorBackgroundOne.color, designData.selectedColorBackgroundTwo.color]).opacity(designData.selectedBackgroundOpacity) : Gradient(colors: [designData.selectedColorBackgroundOne.color, designData.selectedColorBackgroundOne.color]).opacity(designData.selectedBackgroundOpacity))
        .cornerRadius(designData.selectedCornerRadius)
    }
}

struct drawSettingButtonForBackground: View{
    @Binding var designData: BackgroundData
    
    var body: some View{
        
        DrawColorPaletteBox(selectedColor: $designData.selectedColorBackgroundOne, title: headerTitleString.backgroundColor.rawValue)
        
        VStack{
            Text("Gradient")
            Image(systemName: !designData.gradientIsClicked ? "square" : "square.fill")
                .font(.system(size: 18))
            VStack {
                Slider(value: $designData.selectedBackgroundOpacity, in: 0...1)
                    .padding()
            }
        }
        .onTapGesture {
            designData.gradientIsClicked.toggle()
        }
        if designData.gradientIsClicked {
            DrawColorPaletteBox(selectedColor: $designData.selectedColorBackgroundTwo, title: headerTitleString.backgroundColorsRadient.rawValue)
        }
        Divider()
        
        DrawColorPaletteBox(selectedColor: $designData.selectedBorderColor, title: headerTitleString.setBorderColor.rawValue)
        Slider(value: $designData.selectedBorderWidth, in: 0...20)
        
        Divider()
        
        Text(EditImageString.cornerRadius.rawValue)
            .font(.system(size: 26, weight: .bold))
        Slider(value: $designData.selectedCornerRadius, in: 0...50)
    }
}

/*#Preview {
    BackgroundDesignView()
}*/
