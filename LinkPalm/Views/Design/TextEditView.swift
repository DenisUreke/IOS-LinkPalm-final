//
//  FullScreenTxtView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import SwiftUI

struct TextEditView: View {
    
    @Binding var titleData : ImageVideoData
    
    var body: some View {
        
            VStack {
                TextEditor(text: $titleData.textCustomModel.data.text)
             .padding()
             .border(Color.gray)
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
    
    @Binding var titleData : ImageVideoDataList
    @Binding var data: ImageVideoData
    
    var text: TitleCustomModel {
        return self.data.textCustomModel
    }
    var body: some View {
        VStack {
            NavigationLink(destination: TextEditView(titleData: $data)){
                
                configurateTextObjectsPreview(titleData: $titleData, data: $data.textCustomModel)
            }
            .background(text.data.gradientIsClicked ? Gradient(colors: [text.data.selectedColorBackground.color, text.data.selectedColorBackgroundTwo.color]).opacity(text.data.selectedBackgroundOpacity) : Gradient(colors: [text.data.selectedColorBackground.color, text.data.selectedColorBackground.color]).opacity(text.data.selectedBackgroundOpacity) )
            Divider()
                .padding(1)
            
            ScrollView(showsIndicators: false){
                
                configurateTextObjectsFontStyling(titleData: $data.textCustomModel )
                Divider()
                configurateTextObjectsBackGround(titleData: $data.textCustomModel)
                Divider()
                configurateTextObjectsFontColor(titleData: $data.textCustomModel)
                Divider()
                configurateTextObjectsBorderDesign(titleData: $data.textCustomModel)
                Spacer()
                
            }
            
            
            Divider()
                .padding(1)
            NavigationLink(destination: BoxView(titleData: $titleData)) {
                DynamicButtonWithFunction(icon: "square.and.arrow.down", title: "Save", action: { titleData.setTextAndAppendtoList(object: data)})
            }
            .padding()
        }
        
    }
    
}

struct configurateTextObjectsPreview: View {
    
    @Binding var titleData : ImageVideoDataList
    @Binding var data: TitleCustomModel
    
    
    var body: some View{
        
        ZStack{
            VStack{
                Text("\(data.data.text )")
                    .frame(maxWidth: .infinity, alignment: data.data.selectedAlignment.getAlignment)
            }
            .font(.system(size: data.data.selectedSize, weight: data.data.selectedWeight.getWeight, design: data.data.selectedStyle.getFontStyel))
            .opacity(data.data.selectedFontOpacity)
            .foregroundColor(data.data.selectedColorFont.color)
            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
            .shadow(color: !data.data.shadowIsClicked ? .clear : .gray,
                    radius: 2,x: 0, y: !data.data.shadowIsClicked ? 0 : 5)
            .border(data.data.selectedBorderColor.color, width: data.data.selectedBorderWidth)
        }
    }
    
}

struct configurateTextObjectsFontStyling: View{
    
    @Binding var titleData : TitleCustomModel
    
    var body: some View {
        
        SliderDoubleView(minValue: 0, maxValue: 60, objectToChange: $titleData.data.selectedSize, title: EditImageString.fontSize)
        
        Divider()
        
        SelectableView(title: headerTitleString.alignment.rawValue, options: titleData.data.alignmentOptions, selectedOption: $titleData.data.selectedAlignment) { option in
            Text(option.rawValue)
                .frame(width: 200)
        }
        Divider()
        //
        SelectableView(title: headerTitleString.textAlignment.rawValue, options: titleData.data.textAlignmentOptions, selectedOption: $titleData.data.selectedTextAlignment) { option in
            Text(option.rawValue)
                .frame(width: 200)
        }
        Divider()
        //
        SelectableView(title: headerTitleString.fontStyle.rawValue, options: titleData.data.styleOptions, selectedOption: $titleData.data.selectedStyle) { option in
            Text(option.rawValue)
                .frame(width: 200)
        }
        Divider()
        
        SelectableView(title: headerTitleString.fontWeight.rawValue, options: titleData.data.weightOptions, selectedOption: $titleData.data.selectedWeight) { option in
            Text(option.rawValue)
                .frame(width: 200)
        }
    }
    
}

struct configurateTextObjectsBackGround: View{
    
    @Binding var titleData : TitleCustomModel
    
    var body: some View {
        
        DrawColorPaletteBox(selectedColor: $titleData.data.selectedColorBackground, title: headerTitleString.backgroundColor.rawValue)
        VStack{
            Text("Gradient")
            Image(systemName: !titleData.data.gradientIsClicked ? "square" : "square.fill")
                .font(.system(size: 18))
        }
        .onTapGesture {
            titleData.data.gradientIsClicked.toggle()
        }
        if titleData.data.gradientIsClicked {
            DrawColorPaletteBox(selectedColor: $titleData.data.selectedColorBackgroundTwo, title: headerTitleString.backgroundColorsRadient.rawValue)
        }
        VStack {
            Slider(value: $titleData.data.selectedBackgroundOpacity, in: 0...1)
                .padding()
        }
    }
}

struct configurateTextObjectsFontColor: View{
    
    @Binding var titleData : TitleCustomModel
    
    var body: some View {
        
        DrawColorPaletteBox(selectedColor: $titleData.data.selectedColorFont, title: headerTitleString.fontColor.rawValue)
        VStack{
            Text("Shadow")
            Image(systemName: !titleData.data.shadowIsClicked ? "square" : "square.fill")
                .font(.system(size: 18))
        }
        .onTapGesture {
            titleData.data.shadowIsClicked.toggle()
        }
        VStack {
            Slider(value: $titleData.data.selectedFontOpacity, in: 0...1)
        }
    }
}

struct configurateTextObjectsBorderDesign: View{
    
    @Binding var titleData : TitleCustomModel
    
    var body: some View {
        
        DrawColorPaletteBox(selectedColor: $titleData.data.selectedBorderColor, title: headerTitleString.setBorderColor.rawValue)
        Slider(value: $titleData.data.selectedBorderWidth, in: 0...20)
        
        SliderDoubleView(minValue: 0, maxValue: 50, objectToChange: $titleData.data.selectedCornerRadius, title: EditImageString.cornerRadius)
        
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
                            .fill(option.color)
                            .frame(height: 50)
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

struct DrawSFSymbolsChoices: View {
    
    @Binding var selectedSFSymbol: SFSymbolEnum
    let title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 26, weight: .bold))
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(SFSymbolEnum.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedSFSymbol = option
                    }) {
                        Image(systemName: "\(option)")
                            .foregroundColor(Color.black)
                            .font(.largeTitle)
                            .frame(width: 50, height: 50)
                            .background(
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.white)
                            .frame(height: 50)
                            .overlay(
                                selectedSFSymbol == option ?
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                    .stroke(Color.blue, lineWidth: 5) :
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                    .stroke(Color.black, lineWidth: 1)
                                )
                            )
                    }
                }
            }
        }
    }
}

struct DrawEmojis: View {
    
    @Binding var selectedEmoji: Emojis
    let title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 26, weight: .bold))
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(Emojis.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedEmoji = option
                    }) {
                        Text(option.rawValue) // Use Text to display the emoji
                            .font(.largeTitle) // Adjust font size as needed
                            .frame(width: 50, height: 50)
                            .background(
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.white)
                            .frame(height: 50)
                            .overlay(
                                selectedEmoji == option ?
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                    .stroke(Color.blue, lineWidth: 5) :
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                    .stroke(Color.black, lineWidth: 1)
                                )
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
