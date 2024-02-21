//
//  WideBarEditView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-11.
//

import SwiftUI

struct WideBarEditView: View {
    
    @Binding var userDesign: WideBarListData
    @State var choiceClicked: WideListViewEnumChoice = .none
    @State var isIcon: Bool = true
    @State var isEditMode: Bool = true
    @State var index: Int = 0
    
    var body: some View {
        VStack{
            
            WideBarListViewForEdit(userDesign: $userDesign, indexOfButton: $index)
                .frame(height: 65)
            
            WideBarEditViewAddRemoveButton(userDesign: $userDesign, index: $index)
            
            ScrollView(showsIndicators: false){
                
                drawToggleButtons(icon: "popcorn.circle", icon2: "textformat", title: "Icons", title2: "Text", toggleBool: $isIcon)
                
                if isIcon{
                    WideBarEditViewIconChoice(userDesign: $userDesign, index: $index)
                }else{
                    DrawTextFieldForWideBar(title: $userDesign.listOfIcons[index].text)
                    configureWideBarTextObjects(titleData: $userDesign.listOfIcons[index])
                }
                Divider()
                WideBarEditViewBackGroundChoice(userDesign: $userDesign, index: $index)
                Divider()
                if userDesign.checkIfLinkExists(){  WideBarEditClearButton(userDesign: $userDesign, choiceClicked: $choiceClicked, index: $index)
                    Divider()
                }
                WideBarEditSetWebAddress(userDesign: $userDesign, choiceClicked: $choiceClicked, index: $index)
                Divider()
                WideBarEditSetVideoAddress(userDesign: $userDesign, choiceClicked: $choiceClicked, index: $index)
            }
        }
        .padding()
    }
}

struct drawToggleButtons: View{
    
    let icon: String
    let icon2:String
    let title: String
    let title2: String
    @Binding var toggleBool: Bool
    
    var body: some View{
        
        HStack{
            Button(action:{
                toggleBool = true
            }){
                toggleBool ? ButtonDesign(icon: "\(icon)", title: "\(title)", borderColor: Color.blue, borderThickness: 5, width: 150, height:50) : ButtonDesign(icon: "\(icon)", title: "\(title)", borderColor: Color.black, borderThickness: 2, width: 150, height:50)
            }
            .frame(maxWidth: 150)
            Button(action:{
                toggleBool = false
            }){
                !toggleBool ? ButtonDesign(icon: "\(icon2)", title: "\(title2)", borderColor: Color.blue, borderThickness: 5, width: 150, height:50) : ButtonDesign(icon: "\(icon2)", title: "\(title2)", borderColor: Color.black, borderThickness: 2 , width: 150, height:50)
            }
            .frame(maxWidth: 150)
        }
    }
}

struct WideBarEditViewAddRemoveButton: View{
    
    @Binding var userDesign: WideBarListData
    @Binding var index: Int
    
    var body: some View {
        
        Divider()
        
        HStack{
            Button(action: {
                index = userDesign.returnCorrectIndexAfterAdding()
            }
            ){
                Image(systemName: "plus.square")
                    .font(.system(size: 36))
                    .foregroundColor(Color.black)
            }
            Button(action: {
                if userDesign.buttonCount > 1{
                    index = userDesign.buttonCount - 2
                    userDesign.removeButtonFromWideList()
                }
            }
            ){
                Image(systemName: "minus.square")
                    .font(.system(size: 36))
                    .foregroundColor(Color.black)
            }
        }
        Divider()
    }
}

struct WideBarEditViewIconChoice: View{
    
    @Binding var userDesign : WideBarListData
    @Binding var index: Int
    
    var body: some View {
        
        DrawSFSymbolsChoices(selectedSFSymbol: $userDesign.listOfIcons[index].sfIcon , title: headerTitleString.sfSymbolList.rawValue)
        Text(headerTitleString.iconSize.rawValue)
            .font(.system(size: 26, weight: .bold))
        Slider(value: $userDesign.listOfIcons[index].iconSize, in: 10...36 )
        
        DrawColorPaletteBox(selectedColor: $userDesign.listOfIcons[index].iconColor, title: headerTitleString.iconColor.rawValue)
        
        Slider(value: $userDesign.listOfIcons[index].iconOpacity, in: 0...1 )
    }
}

struct WideBarEditViewBackGroundChoice: View{
    
    @Binding var userDesign : WideBarListData
    @Binding var index: Int
    
    var body: some View {
        
        DrawColorPaletteBox(selectedColor: $userDesign.listOfIcons[index].backgroundColor, title: headerTitleString.backgroundColor.rawValue)
        
        if userDesign.listOfIcons[index].gradientIsClicked {
            DrawColorPaletteBox(selectedColor: $userDesign.listOfIcons[index].backgroundColorTwo, title: headerTitleString.backgroundColorsRadient.rawValue)
        }
        VStack{
            Text("Gradient")
            Image(systemName: !userDesign.listOfIcons[index].gradientIsClicked ? "square" : "square.fill")
                .font(.system(size: 18))
        }
        .onTapGesture {
            userDesign.listOfIcons[index].gradientIsClicked.toggle()
        }
        
        VStack {
            Slider(value: $userDesign.listOfIcons[index].backgroundOpacity, in: 0...1)
                .padding()
        }
    }
}

struct WideBarEditSetWebAddress: View {
    
    @Binding var userDesign : WideBarListData
    @Binding var choiceClicked : WideListViewEnumChoice
    @Binding var index: Int
    
    var body: some View {
        
        if choiceClicked == .none{
            VStack{
                Text("Website")
                Image(systemName: !userDesign.listOfIcons[index].isWebLink  ? "square" : "square.fill")
                    .font(.system(size: 18))
            }
            .onTapGesture {
                choiceClicked = .website
            }
        }
        if choiceClicked == .website{
            HStack {
                TextField("Web Address", text: $userDesign.listOfIcons[index].webAddress)
                    .padding()
                    .border(Color.gray)
                    .accentColor(.gray)
                    .foregroundColor(Color.black)
            }
            Button(action: {
                userDesign.listOfIcons[index].isVideoLink = false
                userDesign.listOfIcons[index].isWebLink = true
                choiceClicked = .none
            }){
                ButtonDesign(icon: "square.and.arrow.down", title: "Save", borderColor: Color.black, borderThickness: 2, width: 150, height:50)
            }
        }
        
    }
}

struct WideBarEditSetVideoAddress: View {
    
    @Binding var userDesign : WideBarListData
    @Binding var choiceClicked : WideListViewEnumChoice
    @Binding var index : Int
    
    var body: some View {
        
        if choiceClicked == .none{
            VStack{
                Text("Video")
                Image(systemName: !userDesign.listOfIcons[index].isVideoLink  ? "square" : "square.fill")
                    .font(.system(size: 18))
            }
            .onTapGesture {
                choiceClicked = .video
            }
        }
        if choiceClicked == .video{
            HStack {
                TextField("Web Address", text: $userDesign.listOfIcons.last!.webAddress)
                    .padding()
                    .border(Color.gray)
                    .accentColor(.gray)
                    .foregroundColor(Color.black)
            }
            Button(action: {
                userDesign.listOfIcons[index].isWebLink = false
                userDesign.listOfIcons[index].isVideoLink = true
                choiceClicked = .none
            }){
                ButtonDesign(icon: "square.and.arrow.down", title: "Save", borderColor: Color.black, borderThickness: 2, width: 150, height:50)
            }
        }
    }
}

struct WideBarEditClearButton: View {
    
    @Binding var userDesign : WideBarListData
    @Binding var choiceClicked : WideListViewEnumChoice
    @Binding var index: Int
    
    var body: some View {
        
        Button(action: {
            userDesign.resetAdressValues(index: index)
            choiceClicked = .none
        }){
            ButtonDesign(icon: "clear", title: "Clear links", borderColor: Color.black, borderThickness: 2, width: 180, height:50)
        }
    }
}

struct configureWideBarTextObjects : View{
    
    @Binding var titleData : WideBarListDataicons
    
    var body: some View {
        
        SliderDoubleView(minValue: 0, maxValue: 40, objectToChange: $titleData.selectedSize, title: EditImageString.fontSize)
        
        Divider()
        
        SelectableView(title: headerTitleString.alignment.rawValue, options: titleData.alignmentOptions, selectedOption: $titleData.selectedAlignment) { option in
            Text(option.rawValue)
                .frame(width: 200)
        }
        Divider()

        SelectableView(title: headerTitleString.textAlignment.rawValue, options: titleData.textAlignmentOptions, selectedOption: $titleData.selectedTextAlignment) { option in
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

struct DrawTextFieldForWideBar: View {
    
    @Binding var title: String

    var body: some View {
        VStack {
            TextField("Text here", text: $title)
                .frame(width: 300, height: 30)
                .padding()
                .multilineTextAlignment(.center)
                .border(Color.gray)
        }
    }
}

#Preview {
    WideBarEditView(userDesign: .constant(WideBarListData()))
}
