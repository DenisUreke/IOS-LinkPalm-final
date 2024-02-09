//
//  FullScreenTxtView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import SwiftUI

struct TextEditView: View {
    
    @Binding var titleData : TitleCustomModel
    
    /*var titleShortcut: TitleType { // Replace TitleType with the actual type of `title`
        return self.titleData.TextBoxDesign.title
    }*/
    
    var body: some View {
        VStack{
            HStack {
                TextField("Title", text: $titleData.title)
             .padding()
             .border(Color.gray)
             }
             Spacer()
            VStack {
                TextEditor(text: $titleData.text)
             .padding()
             .border(Color.gray)
             }
            //configurateTextObjects()
        }
        .padding()
        
    }
}

struct SelectableView<Option: RawRepresentable & Hashable, Content: View>: View where Option.RawValue == String {
    
    let title: String
    let options: [Option]
    @Binding var selectedOption: Option
    let label: (Option) -> Content
    
    var body: some View {
        Text("\(title)")
            .font(.system(size: 26, weight: .bold))
        ForEach(options, id: \.self) { option in
            Button(action: {
                self.selectedOption = option
            }) {
                HStack {
                    self.label(option)
                        .font(.title3)
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(.black)
            .background(selectedOption == option ? Color.blue.opacity(0.5) : Color.clear)
        }
    }
}

struct configurateTextObjects: View {
    
    @Binding var titleData : TitleCustomModel

    var body: some View {
        VStack {
            ZStack{
                VStack{
                    Text("Sample Text")
                        .frame(maxWidth: .infinity, alignment: titleData.selectedAlignment.getAlignment)
                }
                    .font(.system(size: titleData.selectedSize, weight: titleData.selectedWeight.getWeight, design: titleData.selectedStyle.getFontStyel))
                    .opacity(titleData.selectedFontOpacity)
                    .foregroundColor(titleData.selectedColorFont.color)
                    .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                    .shadow(color: !titleData.shadowIsClicked ? .clear : .gray,
                     radius: 2,x: 0, y: !titleData.shadowIsClicked ? 0 : 5)
                    .border(titleData.selectedBorderColor.color, width: titleData.selectedBorderWidth)
            }
            .background(titleData.gradientIsClicked ? Gradient(colors: [titleData.selectedColorBackground.color, .white]).opacity(titleData.selectedBackgroundOpacity) : Gradient(colors: [titleData.selectedColorBackground.color, titleData.selectedColorBackground.color]).opacity(titleData.selectedBackgroundOpacity) )
            
            Divider()
            
            ScrollView{
                Text(headerTitleString.fontSize.rawValue)
                    .font(.system(size: 26, weight: .bold))
                
                VStack {
                    Slider(value: $titleData.selectedSize, in: 0...60)
                }
                Divider()
                
                SelectableView(title: headerTitleString.alignment.rawValue, options: titleData.alignmentOptions, selectedOption: $titleData.selectedAlignment) { option in
                    Text(option.rawValue)
                        .frame(width: 200)
                }
                Divider()
                
                SelectableView(title: headerTitleString.fontStyle.rawValue, options: titleData.styleOptions, selectedOption: $titleData.selectedStyle) { option in
                    Text(option.rawValue)
                        .frame(width: 200)
                }
                Divider()
                
                SelectableView(title: headerTitleString.fontWeight.rawValue, options: titleData.weightOptions, selectedOption: $titleData.selectedWeight) { option in
                    Text(option.rawValue)
                        .frame(width: 200)
                }
                Divider()
                
                DrawColorPaletteBox(selectedColor: $titleData.selectedColorBackground, title: headerTitleString.backgroundColor.rawValue)
                VStack{
                    Text("Gradient")
                    Image(systemName: !titleData.gradientIsClicked ? "square" : "square.fill")
                        .font(.system(size: 18))
                }
                .onTapGesture {
                    titleData.gradientIsClicked.toggle()
                }
                VStack {
                    Slider(value: $titleData.selectedBackgroundOpacity, in: 0...1)
                        .padding()
                }
                Divider()
                
                DrawColorPaletteBox(selectedColor: $titleData.selectedColorFont, title: headerTitleString.fontColor.rawValue)
                VStack{
                    Text("Shadow")
                    Image(systemName: !titleData.shadowIsClicked ? "square" : "square.fill")
                        .font(.system(size: 18))
                }
                .onTapGesture {
                    titleData.shadowIsClicked.toggle()
                }
                VStack {
                    Slider(value: $titleData.selectedFontOpacity, in: 0...1)
                }
                Divider()
                
                DrawColorPaletteBox(selectedColor: $titleData.selectedBorderColor, title: headerTitleString.setBorderColor.rawValue)
                Slider(value: $titleData.selectedBorderWidth, in: 0...10) // Range from 0 to 100, dont forget!
                //Text("Thickness: \(titleData.selectedBorderWidth * 10, specifier: "%.0f")%")
                
                Spacer()
                
            }
            .scrollIndicators(.hidden)
        }
    }
    
}

struct DrawColorPaletteBox: View {
    
    @Binding var selectedColor: StandardColors
    
    let colorArray: [StandardColors] = Array(StandardColors.allCases)
    let title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 26, weight: .bold))
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(colorArray, id: \.self) { option in
                    Button(action: {
                        self.selectedColor = option
                    }) {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(option.color) // Here you need to implement a way to convert StandardColors to Color
                            .frame(height: 50) // Set a fixed height for each box
                            .overlay(
                                selectedColor == option ?                                 
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                    .stroke(Color.blue, lineWidth: 5) :
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                }
            }
        }
    }
}




/*#Preview {
    FullScreenTxtView()
}*/
