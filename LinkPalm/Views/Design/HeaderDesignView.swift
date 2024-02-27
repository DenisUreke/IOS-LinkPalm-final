//
//  HeaderDesignView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-24.
//

import SwiftUI

struct DesignHeaderForCardView: View {

    @Binding var user: UserDesignModel
    @Binding var boxData: BoxData
    @Binding var userDesign: ImageVideoDataList
    @State var isIcon: Bool = true
    
    var body: some View{
        
        VStack{
            CardViewBox(boxData: $boxData, userDesign: $userDesign)
                .frame(height: 120)
                .clipped()
            
            drawToggleButtons(icon: "popcorn.circle", icon2: "textformat", title: "Icons", title2: "Text", toggleBool: $isIcon)
            
            ScrollView(showsIndicators: false){
                if !isIcon{
                    HStack(spacing: -25){
                        DrawDynamicButton(selectedMenuButton: ButtonEnum.person)
                            .scaleEffect(user.typeOfContact == .person ? 0.7 : 0.5)
                            .onTapGesture {
                                user.typeOfContact = .person
                            }
                        DrawDynamicButton(selectedMenuButton: ButtonEnum.item)
                            .scaleEffect(user.typeOfContact == .item ? 0.7 : 0.5)
                            .onTapGesture {
                                user.typeOfContact = .item
                            }
                        DrawDynamicButton(selectedMenuButton: ButtonEnum.company)
                            .scaleEffect(user.typeOfContact == .company ? 0.7 : 0.5)
                            .onTapGesture {
                                user.typeOfContact = .company
                            }
                    }
                    .padding(.bottom, -40)
                    VStack(spacing: -50){
                        drawTextfieldForDesign(selectedName: $user.userName, defaultText: "Enter Name" )
                        drawTextfieldForDesign(selectedName: $user.city, defaultText: "Enter City" )
                        drawTextfieldForDesign(selectedName: $user.country, defaultText: "Enter Country" )
                        drawTextfieldForDesign(selectedName: $user.brand, defaultText: "Enter Brand" )
                        
                    }
                }else{
                    DrawSFSymbolsChoices(selectedSFSymbol: $boxData.boxDesign.sfSymbol.data.sfIcon , title: headerTitleString.sfSymbolList.rawValue)
                    SliderDoubleView(minValue: 0, maxValue: 200, objectToChange: $boxData.boxDesign.sfSymbol.data.selectedSize , title: EditImageString.fontSize)
                    SliderDoubleView(minValue: 0, maxValue: 1, objectToChange: $boxData.boxDesign.sfSymbol.data.selectedFontOpacity , title: EditImageString.opacity)
                    SliderDoubleView(minValue: -100, maxValue: 100, objectToChange: $boxData.boxDesign.sfSymbol.data.selectedXOffsetIcon , title: EditImageString.xOffsetIcon)
                    DrawColorPaletteBox(selectedColor: $boxData.boxDesign.sfSymbol.data.selectedColorFont, title: headerTitleString.fontColor.rawValue)
                    
                }
                
                Divider()

                drawSettingButtonForBackground(designData: $boxData.boxDesign.background.data)
                
                NavigationLink(destination: PhotoView(designData: $userDesign, newObject: $boxData.boxDesign.imageVideoData , isForList: false) ){
                    VStack{
                        ButtonDesign(icon: "photo", title: "Image", borderColor: .black, borderThickness: 2, width: 150, height: 50)
                    }
                }
            }
        }
        .padding()
    }
    
}

struct drawTextfieldForDesign: View {
    
    @Binding var selectedName: String
    var defaultText: String
    
    var body: some View{
        
        TextField("\(defaultText)", text: $selectedName)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .frame(width: 300, height: 40)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(30)
    }
    
}
