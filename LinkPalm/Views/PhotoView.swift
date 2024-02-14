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
            
            SliderDoubleView(minValue: 0, maxValue: 10, objectToChange: $designData.imageData.selectedContrast, title: EditImageString.contrast)
            
            Divider()
            
            SliderDoubleView(minValue: 0, maxValue: 10, objectToChange: $designData.imageData.selectedSaturation, title: EditImageString.saturation)
            
            Divider()
            
            SliderDoubleView(minValue: 0, maxValue: 360, objectToChange: $designData.imageData.selectedRotation, title: EditImageString.rotation)
            
            Divider()

            SliderDoubleView(minValue: 0, maxValue: 360, objectToChange: $designData.imageData.selectedHueRotation, title: EditImageString.hueRotation)
            
            Divider()
            
            SliderDoubleView(minValue: 0, maxValue: 1, objectToChange: $designData.imageData.selectedOpacity, title: EditImageString.opacity)
            
            Divider()
            
            configurateTextObjectsBorderDesign(titleData: $designData.textCustomModel)
            
            Divider()
            
            SliderDoubleView(minValue: 0, maxValue: 50, objectToChange: $designData.textCustomModel.selectedImageCornerRadius, title: EditImageString.imageCornerRadius)
            
            
        }
    }
}

struct SliderDoubleView: View{
    
    @State var minValue: Double
    @State var maxValue: Double
    @Binding var objectToChange: Double
    let title : EditImageString
    
    var body: some View{
        Text(title.rawValue)
            .font(.system(size: 26, weight: .bold))
        Slider(value: $objectToChange, in: minValue...maxValue)
    }
}
