//
//  PhotoView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import PhotosUI
import SwiftUI

struct PhotoView: View {
    
    @Binding var designData: ImageVideoData
    
    @State private var photopickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var ImageIsChosen = false
    @State private var editImageClicked = false
    @State private var contrast: Double = 0

    var body: some View {
        
        VStack{
            if designData.imageData.selectedBackgroundImage != nil {
                designData.imageData.selectedBackgroundImage!
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .opacity(designData.imageData.selectedOpacity)
                    .saturation(designData.imageData.selectedSaturation)
                    .contrast(designData.imageData.selectedContrast)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Optional: Add a border to the placeholder
                            .stroke(Color.gray, lineWidth: 1)
                    )
            } else {
                Text("Select a Image")
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 200) // Set the same size for consistency
                    .background(Color.white) // Optional: Set a background color to make the placeholder more visible
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Optional: Add a border to the placeholder
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
                    Divider()
                    
            ScrollView{
                if designData.imageData.selectedBackgroundImage != nil{
                    VStack{
                        Text("Scale to Fill")
                            .font(.system(size: 26, weight: .bold))
                        Image(systemName: !designData.imageData.scaledToFill ? "square" : "square.fill")
                            .font(.system(size: 26))
                    }
                    .onTapGesture {
                        designData.imageData.scaledToFill.toggle()
                    }
                    
                    Divider()
                    
                    Text(EditImageString.contrast.rawValue)
                        .font(.system(size: 26, weight: .bold))
                    Slider(value: $designData.imageData.selectedContrast , in: 0...10)
                    
                    Divider()
                    
                    Text(EditImageString.saturation.rawValue)
                        .font(.system(size: 26, weight: .bold))
                    Slider(value: $designData.imageData.selectedSaturation, in: 0...10)
                    
                    Divider()
                    
                    Text(EditImageString.opacity.rawValue)
                        .font(.system(size: 26, weight: .bold))
                    Slider(value: $designData.imageData.selectedOpacity, in: 0...1)
                    
                }
            }
            DynamicButtonWithFunction(icon: "square.and.arrow.down", title: "Save", action: { designData.setTypeOfBox(type: ImageVideoEnum.picture) })
                .padding(.all, -20)
            
            PhotosPicker("Select Image", selection: $photopickerItem, matching: .images)
            
        }
        .onChange(of: photopickerItem) {
            Task {
                if let loaded = try? await photopickerItem?.loadTransferable(type: Image.self) {
                    selectedImage = loaded
                    ImageIsChosen.toggle()
                    designData.imageData.selectedBackgroundImage = selectedImage
                } else {
                    print("Failed")
                }
            }
        }
    }
}
