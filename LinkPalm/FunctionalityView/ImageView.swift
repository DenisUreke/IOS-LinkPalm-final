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
        if let image = imageData.imageData.data.selectedBackgroundImage{
            image
                .resizable()
                .cornerRadius(8)
                .padding(0)
                .clipped()
                .scaleEffect(imageData.imageData.data.selectedScale)
                .offset(x: imageData.imageData.data.selectedXAxisOffset, y: imageData.imageData.data.selectedYAxisOffset)
                .clipShape(RoundedRectangle(cornerRadius: imageData.textCustomModel.data.selectedImageCornerRadius))
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(imageData.imageData.data.selectedRotation))
                .hueRotation(.degrees(imageData.imageData.data.selectedHueRotation))
                .opacity(imageData.imageData.data.selectedOpacity)
                .saturation(imageData.imageData.data.selectedSaturation)
                .contrast(imageData.imageData.data.selectedContrast)
                .border(imageData.textCustomModel.data.selectedBorderColor.color, width: imageData.textCustomModel.data.selectedBorderWidth)
                .overlay(
                    RoundedRectangle(cornerRadius: imageData.textCustomModel.data.selectedImageCornerRadius)
                        .stroke(imageData.textCustomModel.data.selectedBorderColor.color, lineWidth: imageData.textCustomModel.data.selectedBorderWidth)
                )
                .conditionalScaledToFill(apply: imageData.imageData.data.scaledToFill)
        }else{
            Text("Could not find Image")
                .font(.system(size: 40))
        }

    }
}

