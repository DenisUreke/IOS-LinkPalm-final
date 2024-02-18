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
        AsyncImage(url: imageData.imageData.imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .scaleEffect(3)
            case .success(let image):
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
                    .cornerRadius(imageData.textCustomModel.selectedCornerRadius)
                    .clipped()
            case .failure:
                Text("Unable to load image")
            @unknown default:
                EmptyView()
            }
        }
    }
}
