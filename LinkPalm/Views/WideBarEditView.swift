//
//  WideBarEditView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-11.
//

import SwiftUI

struct WideBarEditView: View {
    
    @Binding var userDesign : WideBarListData
    
    var body: some View {
        VStack{
            WideBarListView(userDesign: $userDesign)
                .frame(height: 65)
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
            
            ScrollView(showsIndicators: false){
                Text(headerTitleString.iconSize.rawValue)
                    .font(.system(size: 26, weight: .bold))
                
                Slider(value: $userDesign.listOfIcons.last!.iconSize, in: 10...36 )
                
                DrawColorPaletteBox(selectedColor: $userDesign.listOfIcons.last!.iconColor, title: headerTitleString.iconColor.rawValue)
                
                Slider(value: $userDesign.listOfIcons.last!.iconOpacity, in: 0...1 )
                
                Divider()
                
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
                
                DrawSFSymbolsChoices(selectedSFSymbol: $userDesign.listOfIcons.last!.sfIcon , title: headerTitleString.sfSymbolList.rawValue)
                
            }
        }
        
        .padding()
    }
    
}



#Preview {
    WideBarEditView(userDesign: .constant(WideBarListData()))
}
