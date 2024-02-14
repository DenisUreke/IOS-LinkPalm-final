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
    @State var enteredText: String = ""
    @State var isURL = false
    @State var isDevice = false
    @State var openSave = false
    
    @State var photopickerItem: PhotosPickerItem?
    @State var selectedImage: Image?

    var body: some View {
        
        VStack{
            if isURL {
                DynamicPictureViewFromWeb(imageData: designData)
            }
            if isDevice {
                DynamicPictureView(imageData: designData)
            }
                    Divider()

            ScrollView(showsIndicators: false){
                if isURL || isDevice{
                    PhotoEditingTools(designData: $designData)
                }
            }
            
            if isURL {
                VStack {
                    TextField("Enter URL", text: $enteredText)
                        .frame(width: 300)
                 .padding()
                 .multilineTextAlignment(.center)
                 .border(Color.gray)
                 }
            }
            
            if isDevice{
                VStack{
                    PhotosPicker("Or select from device", selection: $photopickerItem, matching: .images)
                }
            }
            
            HStack{
                HStack{
                    isDevice ? ButtonDesign(icon: "square.and.arrow.up", title: "Device", borderColor: Color.blue, borderThickness: 5) : ButtonDesign(icon: "square.and.arrow.up", title: "Device", borderColor: Color.black, borderThickness: 2)

                }
                .onTapGesture {
                    isDevice.toggle()
                    isURL = false
                    openSave = true
                }
                    .padding(.trailing, -20)
                
                HStack{
                    isURL ? ButtonDesign(icon: "globe", title: "URL", borderColor: Color.blue, borderThickness: 5) : ButtonDesign(icon: "globe", title: "URL", borderColor: Color.black, borderThickness: 2)

                }
                .onTapGesture {
                    isURL.toggle()
                    isDevice = false
                    openSave = true
                }
            }
            if openSave{
                if isURL || isDevice{
                    HStack{
                        ButtonDesign(icon: "square.and.arrow.down", title: "Save", borderColor: Color.black, borderThickness: 2)
                            }
                    .onTapGesture{
                        if isURL{
                            designData.setImageUrlFromString(string: enteredText)
                            openSave = false
                        }
                        else{
                            designData.setImageFromDevice()
                            openSave = false
                        }
                    }
                }
            }
        }
        .padding()
        .onChange(of: photopickerItem) {
            Task {
                if let loaded = try? await photopickerItem?.loadTransferable(type: Image.self) {
                    selectedImage = loaded
                    designData.imageData.selectedBackgroundImage = selectedImage
                } else {
                    print("Failed")
                }
            }
        }
    }
}

struct PhotoEditingTools: View{
    
    @Binding var designData: ImageVideoData
    
    var body: some View{
        
        if designData.imageData.selectedBackgroundImage != nil || !designData.imageData.imageURL.absoluteString.isEmpty{
            
            Text(EditImageString.contrast.rawValue)
                .font(.system(size: 26, weight: .bold))
            Slider(value: $designData.imageData.selectedContrast , in: 0...10)
            
            Divider()
            
            Text(EditImageString.saturation.rawValue)
                .font(.system(size: 26, weight: .bold))
            Slider(value: $designData.imageData.selectedSaturation, in: 0...10)
            
            Divider()
            
            Text(EditImageString.rotation.rawValue)
                .font(.system(size: 26, weight: .bold))
            Slider(value: $designData.imageData.selectedRotation, in: 0...360)
            
            Divider()
            
            Text(EditImageString.hueRotation.rawValue)
                .font(.system(size: 26, weight: .bold))
            Slider(value: $designData.imageData.selectedHueRotation, in: 0...360)
            
            Divider()
            
            Text(EditImageString.opacity.rawValue)
                .font(.system(size: 26, weight: .bold))
            Slider(value: $designData.imageData.selectedOpacity, in: 0...1)
            
            Divider()
            
            configurateTextObjectsBorderDesign(titleData: $designData.textCustomModel)
            
            Divider()
            
            Text(EditImageString.imageCornerRadius.rawValue)
                .font(.system(size: 26, weight: .bold))
            Slider(value: $designData.textCustomModel.selectedImageCornerRadius, in: 0...50)
            
        }
    }
}


/*
 if designData.imageData.selectedBackgroundImage != nil && isDevice {
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
 }*/
