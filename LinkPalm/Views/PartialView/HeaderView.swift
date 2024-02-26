//
//  HeaderView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-24.
//

import SwiftUI

struct HeaderForCardView: View{
    
    @Binding var boxData: BoxData
    @Binding var userDesign: ImageVideoDataList
    @Binding var user: UserDesignModel
    
    var body: some View{
        
        ZStack{
            DrawBackGroundForBoxDesign(backgroundDesign: $boxData.boxDesign.background.data)
            
            if boxData.boxDesign.imageVideoData.typeOfBox == ImageVideoEnum.picture {DynamicPictureView(imageData: $boxData.boxDesign.imageVideoData)
            }
            if let url = boxData.boxDesign.imageVideoData.imageData.data.imageURL, !url.path.isEmpty {
                DynamicPictureViewFromWeb(imageData: $boxData.boxDesign.imageVideoData)
            }
            
            DrawSFSymbolForDesingBox(sfSymbolData: $boxData.boxDesign.sfSymbol.data)
        }
    }
}
