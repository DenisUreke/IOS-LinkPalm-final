//
//  WideBarEditView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-11.
//

import SwiftUI

struct WideBarEditView: View {
    
    @Binding var userDesign : WideBarListData
    @State var choiceClicked : WideListViewEnumChoice = .none
    
    var body: some View {
        VStack{
            WideBarListView(userDesign: $userDesign)
                .frame(height: 65)
            
            WideBarEditViewAddRemoveButton(userDesign: $userDesign)
            
            ScrollView(showsIndicators: false){
                WideBarEditViewIconChoice(userDesign: $userDesign)
                Divider()
                WideBarEditViewBackGroundChoice(userDesign: $userDesign)
                Divider()
                if userDesign.checkIfLinkExists(){  WideBarEditClearButton(userDesign: $userDesign, choiceClicked: $choiceClicked)
                    Divider()
                }
                WideBarEditSetWebAddress(userDesign: $userDesign, choiceClicked: $choiceClicked)
                Divider()
                WideBarEditSetVideoAddress(userDesign: $userDesign, choiceClicked: $choiceClicked)
            }
        }
        .padding()
    }
}

struct WideBarEditViewAddRemoveButton: View{
    
    @Binding var userDesign : WideBarListData
    
    var body: some View {
        
        Divider()
        
        HStack{
            Button(action: {userDesign.addNewButtonToWideList()}){
                Image(systemName: "plus.square")
                    .font(.system(size: 36))
                    .foregroundColor(Color.black)
            }
            Button(action: {userDesign.removeButtonFromWideList()}){
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
    
    var body: some View {
        
        Text(headerTitleString.iconSize.rawValue)
            .font(.system(size: 26, weight: .bold))
        
        DrawSFSymbolsChoices(selectedSFSymbol: $userDesign.listOfIcons.last!.sfIcon , title: headerTitleString.sfSymbolList.rawValue)
        
        Slider(value: $userDesign.listOfIcons.last!.iconSize, in: 10...36 )
        
        DrawColorPaletteBox(selectedColor: $userDesign.listOfIcons.last!.iconColor, title: headerTitleString.iconColor.rawValue)
        
        Slider(value: $userDesign.listOfIcons.last!.iconOpacity, in: 0...1 )
    }
}

struct WideBarEditViewBackGroundChoice: View{
    
    @Binding var userDesign : WideBarListData
    
    var body: some View {
        
        DrawColorPaletteBox(selectedColor: $userDesign.listOfIcons.last!.backgroundColor, title: headerTitleString.backgroundColor.rawValue)
        
        if userDesign.listOfIcons.last!.gradientIsClicked {
            DrawColorPaletteBox(selectedColor: $userDesign.listOfIcons.last!.backgroundColorTwo, title: headerTitleString.backgroundColorsRadient.rawValue)
        }
        VStack{
            Text("Gradient")
            Image(systemName: !userDesign.listOfIcons.last!.gradientIsClicked ? "square" : "square.fill")
                .font(.system(size: 18))
        }
        .onTapGesture {
            userDesign.listOfIcons.last!.gradientIsClicked.toggle()
        }
        
        VStack {
            Slider(value: $userDesign.listOfIcons.last!.backgroundOpacity, in: 0...1)
                .padding()
        }
    }
}

struct WideBarEditSetWebAddress: View {
    
    @Binding var userDesign : WideBarListData
    //@State var setWebAdress : Bool = false
    @Binding var choiceClicked : WideListViewEnumChoice
    
    var body: some View {
        
        if choiceClicked == .none{
            VStack{
                Text("Website")
                Image(systemName: !userDesign.listOfIcons.last!.isWebLink  ? "square" : "square.fill")
                    .font(.system(size: 18))
            }
            .onTapGesture {
                choiceClicked = .website
            }
        }
        if choiceClicked == .website{
            HStack {
                TextField("Web Address", text: $userDesign.listOfIcons.last!.webAddress)
                    .padding()
                    .border(Color.gray)
                    .accentColor(.gray)
                    .foregroundColor(Color.black)
            }
            Button(action: {
                userDesign.listOfIcons.last!.isVideoLink = false 
                userDesign.listOfIcons.last!.isWebLink = true
                choiceClicked = .none
            }){
                Text("Save")
                    .font(.system(size: 18))
                    .foregroundColor(Color.white)
                    .padding(8)
            }
            .frame(width: 200)
            .background(Color.blue)
            .border(.black, width: 1)
            .cornerRadius(10)
        }
        
    }
}

struct WideBarEditSetVideoAddress: View {
    
    @Binding var userDesign : WideBarListData
    //@State var setVideoAdress : Bool = false
    @Binding var choiceClicked : WideListViewEnumChoice
    
    var body: some View {
        
        if choiceClicked == .none{
            VStack{
                Text("Video")
                Image(systemName: !userDesign.listOfIcons.last!.isVideoLink  ? "square" : "square.fill")
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
                userDesign.listOfIcons.last!.isWebLink = false
                userDesign.listOfIcons.last!.isVideoLink = true
                choiceClicked = .none
            }){
                Text("Save")
                    .frame(width: 200)
                    .font(.system(size: 18))
                    .foregroundColor(Color.white)
                    .padding(8)
            }
            .background(Color.blue)
            .border(.black, width: 1)
            .cornerRadius(10)
        }
    }
}

struct WideBarEditClearButton: View {
    
    @Binding var userDesign : WideBarListData
    @Binding var choiceClicked : WideListViewEnumChoice
    
    var body: some View {
        
        Button(action: {
            userDesign.resetAdressValues()
            choiceClicked = .none
        }){
            Text("Clear Links")
                .frame(width: 200)
                .font(.system(size: 18))
                .foregroundColor(Color.white)
                .padding(8)
        }
        .background(Color.blue)
        .border(.black, width: 1)
        .cornerRadius(10)
        
    }
}

#Preview {
    WideBarEditView(userDesign: .constant(WideBarListData()))
}
