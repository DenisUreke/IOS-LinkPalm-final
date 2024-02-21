//
//  ImageView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-18.
//

import SwiftUI

struct DynamicPictureView: View {
    
    @Binding var imageData : ImageVideoData

    var body: some View {
        if let image = imageData.imageData.selectedBackgroundImage{
            image
                .resizable()
                .scaledToFit()
                .scaleEffect(imageData.imageData.selectedScale)
                .offset(x: imageData.imageData.selectedXAxisOffset, y: imageData.imageData.selectedYAxisOffset)
                .clipShape(RoundedRectangle(cornerRadius: imageData.textCustomModel.selectedImageCornerRadius))
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(imageData.imageData.selectedRotation))
                .hueRotation(.degrees(imageData.imageData.selectedHueRotation))
                .opacity(imageData.imageData.selectedOpacity)
                .saturation(imageData.imageData.selectedSaturation)
                .contrast(imageData.imageData.selectedContrast)
                .border(imageData.textCustomModel.selectedBorderColor.color, width: imageData.textCustomModel.selectedBorderWidth)
                .overlay(
                    RoundedRectangle(cornerRadius: imageData.textCustomModel.selectedImageCornerRadius)
                        .stroke(imageData.textCustomModel.selectedBorderColor.color, lineWidth: imageData.textCustomModel.selectedBorderWidth)
                )
                .scaledToFill()
                .clipped()
        }else{
            Text("Could not find Image")
                .font(.system(size: 40))
        }

    }
}

