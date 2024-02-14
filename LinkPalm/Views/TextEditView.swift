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
                TextEditor(text: $titleData.textCustomModel.text)
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
    
    var text: TitleCustomModel {
        return self.titleData.listOfEntries.last!.textCustomModel
    }
    var body: some View {
        VStack {
            NavigationLink(destination: TextEditView(titleData: $titleData.listOfEntries.last!)){
                ZStack{
                    VStack{
                        Text("\(titleData.listOfEntries.last!.textCustomModel.text)")
                            .frame(maxWidth: .infinity, alignment: text.selectedAlignment.getAlignment)
                    }
                    .font(.system(size: text.selectedSize, weight: text.selectedWeight.getWeight, design: text.selectedStyle.getFontStyel))
                    .opacity(text.selectedFontOpacity)
                    .foregroundColor(text.selectedColorFont.color)
                    .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                    .shadow(color: !text.shadowIsClicked ? .clear : .gray,
                            radius: 2,x: 0, y: !text.shadowIsClicked ? 0 : 5)
                    .border(text.selectedBorderColor.color, width: text.selectedBorderWidth)
                }
            }
            .background(text.gradientIsClicked ? Gradient(colors: [text.selectedColorBackground.color, text.selectedColorBackgroundTwo.color]).opacity(text.selectedBackgroundOpacity) : Gradient(colors: [text.selectedColorBackground.color, text.selectedColorBackground.color]).opacity(text.selectedBackgroundOpacity) )
            
            Divider()
                .padding(1)
            
            ScrollView(showsIndicators: false){
                
                configurateTextObjectsFontStyling(titleData: $titleData.listOfEntries.last!.textCustomModel)
                Divider()
                configurateTextObjectsBackGround(titleData: $titleData.listOfEntries.last!.textCustomModel)
                Divider()
                configurateTextObjectsFontColor(titleData: $titleData.listOfEntries.last!.textCustomModel)
                Divider()
                configurateTextObjectsBorderDesign(titleData: $titleData.listOfEntries.last!.textCustomModel)
                Spacer()
                
            }
            
            Divider()
                .padding(1)
            NavigationLink(destination: BoxView(titleData: $titleData)) {
                DynamicButtonWithFunction(icon: "square.and.arrow.down", title: "Save", action: { titleData.listOfEntries.last!.setTypeOfBox(type: ImageVideoEnum.text) })
            }
            .padding()
        }
        
    }
}

struct configurateTextObjectsFontStyling: View{
    
    @Binding var titleData : TitleCustomModel
    
    var body: some View {
        
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
        //
        SelectableView(title: headerTitleString.textAlignment.rawValue, options: titleData.textAlignmentOptions, selectedOption: $titleData.selectedTextAlignment) { option in
            Text(option.rawValue)
                .frame(width: 200)
        }
        Divider()
        //
        SelectableView(title: headerTitleString.fontStyle.rawValue, options: titleData.styleOptions, selectedOption: $titleData.selectedStyle) { option in
            Text(option.rawValue)
                .frame(width: 200)
        }
        Divider()
        
        SelectableView(title: headerTitleString.fontWeight.rawValue, options: titleData.weightOptions, selectedOption: $titleData.selectedWeight) { option in
            Text(option.rawValue)
                .frame(width: 200)
        }
    }
    
}

struct configurateTextObjectsBackGround: View{
    
    @Binding var titleData : TitleCustomModel
    
    var body: some View {
        
        DrawColorPaletteBox(selectedColor: $titleData.selectedColorBackground, title: headerTitleString.backgroundColor.rawValue)
        VStack{
            Text("Gradient")
            Image(systemName: !titleData.gradientIsClicked ? "square" : "square.fill")
                .font(.system(size: 18))
        }
        .onTapGesture {
            titleData.gradientIsClicked.toggle()
        }
        if titleData.gradientIsClicked {
            DrawColorPaletteBox(selectedColor: $titleData.selectedColorBackgroundTwo, title: headerTitleString.backgroundColorsRadient.rawValue)
        }
        VStack {
            Slider(value: $titleData.selectedBackgroundOpacity, in: 0...1)
                .padding()
        }
    }
}

struct configurateTextObjectsFontColor: View{
    
    @Binding var titleData : TitleCustomModel
    
    var body: some View {
        
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
    }
}

struct configurateTextObjectsBorderDesign: View{
    
    @Binding var titleData : TitleCustomModel
    
    var body: some View {
        
        DrawColorPaletteBox(selectedColor: $titleData.selectedBorderColor, title: headerTitleString.setBorderColor.rawValue)
        Slider(value: $titleData.selectedBorderWidth, in: 0...20) // Range from 0 to 100, dont forget!
        
        Text(EditImageString.cornerRadius.rawValue)
            .font(.system(size: 26, weight: .bold))
        Slider(value: $titleData.selectedCornerRadius, in: 0...50)
        
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
