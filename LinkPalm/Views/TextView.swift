//
//  textEditView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-09.
//

import SwiftUI

struct TextView: View {
    
    @Binding var titleData : TitleCustomModel
    
    
    var body: some View {
        ZStack{
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
        }
        .background(titleData.gradientIsClicked ? Gradient(colors: [titleData.selectedColorBackground.color, .white]).opacity(titleData.selectedBackgroundOpacity) : Gradient(colors: [titleData.selectedColorBackground.color, titleData.selectedColorBackground.color]).opacity(titleData.selectedBackgroundOpacity) )
        .padding()
        .toolbar {
            // Define toolbar items here
            ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        NavigationLink(destination: TextEditView(titleData: $titleData)){
                            Button("Insert Text", action: {})
                        }
                        NavigationLink(destination: configurateTextObjects(titleData: $titleData)){
                            Button("Design Header", action: {})
                        }
                        Button("Save", action: {})
                    } label: {
                        Label("Menu", systemImage: "line.3.horizontal")
                    }
                }
        }
        
        Spacer()
        
        ZStack{
            VStack{
                Text("\(titleData.text)")
                    .frame(maxWidth: .infinity, alignment: titleData.selectedAlignment.getAlignment)
            }
                .font(.system(size: titleData.selectedSize, weight: titleData.selectedWeight.getWeight, design: titleData.selectedStyle.getFontStyel))
                .opacity(titleData.selectedFontOpacity)
                .foregroundColor(titleData.selectedColorFont.color)
                .frame(maxWidth: .infinity, maxHeight: 80, alignment: .center)
                .shadow(color: !titleData.shadowIsClicked ? .clear : .gray,
                 radius: 2,x: 0, y: !titleData.shadowIsClicked ? 0 : 5)
                .border(titleData.selectedBorderColor.color, width: titleData.selectedBorderWidth)
        }
        .background(titleData.gradientIsClicked ? Gradient(colors: [titleData.selectedColorBackground.color, .white]).opacity(titleData.selectedBackgroundOpacity) : Gradient(colors: [titleData.selectedColorBackground.color, titleData.selectedColorBackground.color]).opacity(titleData.selectedBackgroundOpacity) )
        .padding()
    }
    
}

/*#Preview {
    TextView()
}*/
