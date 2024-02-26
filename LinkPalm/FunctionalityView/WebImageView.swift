//
//  WebImageView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-18.
//

import SwiftUI

struct DynamicPictureViewFromWeb: View {
    
    @Binding var imageData: ImageVideoData
 
    var body: some View {
        AsyncImage(url: imageData.imageData.data.imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .scaleEffect(3)
            case .success(let image):
                image
                    .resizable()
                    .cornerRadius(8)
                    .padding(0)
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
                    .clipped()
            case .failure:
                Text("Unable to load image")
            @unknown default:
                EmptyView()
            }
        }
    }
}
