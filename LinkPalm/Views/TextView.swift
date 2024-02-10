//
//  textEditView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-09.
//

import SwiftUI

struct TextView: View {
    
    @Binding var titleData : TextBoxDesignData
    
    var title: TitleCustomModel {
        return self.titleData.TextBoxDesign.title
    }
    
    var text: TitleCustomModel {
        return self.titleData.TextBoxDesign.text
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack{
                VStack{
                    Text("\(title.title)")
                        .frame(maxWidth: .infinity, alignment: title.selectedAlignment.getAlignment)
                }
                .font(.system(size: title.selectedSize, weight: title.selectedWeight.getWeight, design: title.selectedStyle.getFontStyel))
                .opacity(title.selectedFontOpacity)
                .foregroundColor(title.selectedColorFont.color)
                .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 0.1, alignment: .center)
                .shadow(color: !title.shadowIsClicked ? .clear : .gray,
                        radius: 2,x: 0, y: !title.shadowIsClicked ? 0 : 5)
                .border(title.selectedBorderColor.color, width: title.selectedBorderWidth)
                
                .background(title.gradientIsClicked ? Gradient(colors: [title.selectedColorBackground.color, .white]).opacity(title.selectedBackgroundOpacity) : Gradient(colors: [title.selectedColorBackground.color, title.selectedColorBackground.color]).opacity(title.selectedBackgroundOpacity) )
                .toolbar {
                    // Define toolbar items here
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            NavigationLink(destination: TextEditView(titleData: $titleData)){
                                Button("Insert Text", action: {})
                            }
                            NavigationLink(destination: configurateTextObjects(titleData: $titleData.TextBoxDesign.title)){
                                Button("Design Header", action: {})
                            }
                            NavigationLink(destination: configurateTextObjects(titleData: $titleData.TextBoxDesign.text)){
                                Button("Design Text", action: {})
                            }
                            Button("Save", action: {})
                        } label: {
                            Label("Menu", systemImage: "line.3.horizontal")
                        }
                    }
                }
                
                
                VStack{
                    Text("\(text.text)")
                        .frame(maxWidth: .infinity, alignment: text.selectedAlignment.getAlignment)
                        .multilineTextAlignment(text.selectedTextAlignment.getTextAlignment)
                    Spacer()
                }
                .font(.system(size: text.selectedSize, weight: text.selectedWeight.getWeight, design: text.selectedStyle.getFontStyel))
                .opacity(text.selectedFontOpacity)
                .foregroundColor(text.selectedColorFont.color)
                .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 0.9, alignment: .center)
                .shadow(color: !text.shadowIsClicked ? .clear : .gray,
                        radius: 2,x: 0, y: !text.shadowIsClicked ? 0 : 5)
                .border(text.selectedBorderColor.color, width: text.selectedBorderWidth)
                
                .background(text.gradientIsClicked ? Gradient(colors: [text.selectedColorBackground.color, .white]).opacity(text.selectedBackgroundOpacity) : Gradient(colors: [text.selectedColorBackground.color, text.selectedColorBackground.color]).opacity(text.selectedBackgroundOpacity) )
                .padding([.leading, .trailing], 10)
            }
        }
        .padding()
    }
    
}

/*#Preview {
    TextView()
}*/
