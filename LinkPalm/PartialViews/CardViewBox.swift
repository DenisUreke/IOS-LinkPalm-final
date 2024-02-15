//
//  CardViewBox.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-15.
//

import SwiftUI

struct CardViewBox: View {
    
    @Binding var textDesign: TitleCustomModel
    @Binding var backgroundDesign: BackgroundData
    
    var body: some View {
        DynamicViewText(titleData: $textDesign)
            .border(backgroundDesign.selectedBorderColor.color, width: backgroundDesign.selectedBorderWidth)
            .background(backgroundDesign.gradientIsClicked ? Gradient(colors: [backgroundDesign.selectedColorBackgroundOne.color, backgroundDesign.selectedColorBackgroundTwo.color]).opacity(backgroundDesign.selectedBackgroundOpacity) : Gradient(colors: [backgroundDesign.selectedColorBackgroundOne.color, backgroundDesign.selectedColorBackgroundOne.color]).opacity(backgroundDesign.selectedBackgroundOpacity))
            .cornerRadius(backgroundDesign.selectedCornerRadius)
    }
}

struct CardDesignView: View{
    
    var body: some View{
        Text("")
    }
}

/*#Preview {
    CardViewBox()
}*/
