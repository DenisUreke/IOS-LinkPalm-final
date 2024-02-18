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
    
    @State var photopickerItem: PhotosPickerItem?
    @State var selectedImage: Image?

    var body: some View {
        
        VStack{
            if designData.imageData.isURL {
                DynamicPictureViewFromWeb(imageData: $designData)
                    .scaleEffect(0.5)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()
            }
            if designData.imageData.isDevice {
                DynamicPictureView(imageData: $designData)
                    .scaleEffect(0.5)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()
            }
            else{
                Text("Load Image")
            }
            Divider()
            
            ScrollView(showsIndicators: false){
                if designData.imageData.isURL || designData.imageData.isDevice{
                    PhotoEditingTools(designData: $designData)
                }
            }
            
            if designData.imageData.isURL {
                    DrawTextFieldForWideBar(title: $enteredText)
            }
            
            if designData.imageData.isDevice{
                    PhotosPicker("Select from device", selection: $photopickerItem, matching: .images)
            }
            
            HStack{
                HStack{
                    Button(action: {
                        designData.imageData.isDevice.toggle()
                        designData.imageData.isURL = false
                        designData.imageData.isSaved = true
                    })
                    {
                        designData.imageData.isDevice ? ButtonDesign(icon: "square.and.arrow.up", title: "Device", borderColor: Color.blue, borderThickness: 5, width: 180, height:50) : ButtonDesign(icon: "square.and.arrow.up", title: "Device", borderColor: Color.black, borderThickness: 2, width: 180, height:50)
                    }
                }
                .padding(.trailing, -20)
                
                HStack{
                    Button(action: {
                        designData.imageData.isURL.toggle()
                        designData.imageData.isDevice = false
                        designData.imageData.isSaved = true
                    })
                    {
                        designData.imageData.isURL ? ButtonDesign(icon: "globe", title: "URL", borderColor: Color.blue, borderThickness: 5, width: 180, height:50) : ButtonDesign(icon: "globe", title: "URL", borderColor: Color.black, borderThickness: 2, width: 180, height:50)
                    }
                }
            }
            .onDisappear {
                if designData.imageData.isURL{
                    designData.setTypeOfBox(type: .picturefromweb)
                }
                else{
                    designData.setTypeOfBox(type: .picture)
                }
            }
            if designData.imageData.isSaved{
                if designData.imageData.isURL || designData.imageData.isDevice{
                    HStack{
                        
                        Button(action:{
                            if designData.imageData.isURL{
                                designData.setImageUrlFromString(string: enteredText)
                                designData.imageData.isDeletable = true
                                designData.imageData.isSaved = false
                            }
                            else{
                                designData.setImageFromDevice()
                                designData.imageData.isDeletable = true
                                designData.imageData.isSaved = false
                            }
                        }){
                            ButtonDesign(icon: "square.and.arrow.down", title: "Save", borderColor: Color.black, borderThickness: 2, width: 180, height:50)
                        }
                    }
                }
            }
            if designData.imageData.isDeletable{
                Button(action:{
                    designData.imageData.resetValues()
                }){
                    ButtonDesign(icon: "trash.square", title: "Delete", borderColor: Color.black, borderThickness: 2, width: 180, height:50)
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
        
        if designData.imageData.selectedBackgroundImage != nil || ((designData.imageData.imageURL?.absoluteString.isEmpty) == nil){
            
            SliderDoubleView(minValue: -200, maxValue: 200, objectToChange: $designData.imageData.selectedXAxisOffset, title: EditImageString.xOffsetImage)
            SliderDoubleView(minValue: -200, maxValue: 200, objectToChange: $designData.imageData.selectedYAxisOffset, title: EditImageString.yOffsetImage)
            
            Divider()
            
            SliderDoubleView(minValue: 0, maxValue: 3, objectToChange: $designData.imageData.selectedScale, title: EditImageString.imageScale)
            
            Divider()
            
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
            
            SliderDoubleView(minValue: 0, maxValue: 300, objectToChange: $designData.textCustomModel.selectedImageCornerRadius, title: EditImageString.imageCornerRadius)
            
            
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
