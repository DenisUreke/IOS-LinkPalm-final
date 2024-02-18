//
//  PhotoView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import PhotosUI
import SwiftUI

struct PhotoView: View {
    @Binding var designData: ImageVideoDataList
    @Binding var newObject: ImageVideoData
    @State var isForList: Bool
    @State var enteredText: String = ""
    
    @State var photopickerItem: PhotosPickerItem?
    @State var selectedImage: Image?

    var body: some View {
        
        VStack{
            if newObject.imageData.isURL {
                DynamicPictureViewFromWeb(imageData: $newObject)
                    .scaleEffect(0.5)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()
            }
            if newObject.imageData.isDevice {
                DynamicPictureView(imageData: $newObject)
                    .scaleEffect(0.5)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()
            }
            else{
                Text("Load Image")
            }
            Divider()
            
            ScrollView(showsIndicators: false){
                if newObject.imageData.isURL || newObject.imageData.isDevice{
                    PhotoEditingTools(designData: $newObject)
                }
            }
            
            if newObject.imageData.isURL {
                    DrawTextFieldForWideBar(title: $enteredText)
            }
            
            if newObject.imageData.isDevice{
                    PhotosPicker("Select from device", selection: $photopickerItem, matching: .images)
            }
            
            HStack{
                HStack{
                    Button(action: {
                        newObject.imageData.isDevice.toggle()
                        newObject.imageData.isURL = false
                        newObject.imageData.isSaved = true
                    })
                    {
                        newObject.imageData.isDevice ? ButtonDesign(icon: "square.and.arrow.up", title: "Device", borderColor: Color.blue, borderThickness: 5, width: 180, height:50) : ButtonDesign(icon: "square.and.arrow.up", title: "Device", borderColor: Color.black, borderThickness: 2, width: 180, height:50)
                    }
                }
                .padding(.trailing, -20)
                
                HStack{
                    Button(action: {
                        newObject.imageData.isURL.toggle()
                        newObject.imageData.isDevice = false
                        newObject.imageData.isSaved = true
                    })
                    {
                        newObject.imageData.isURL ? ButtonDesign(icon: "globe", title: "URL", borderColor: Color.blue, borderThickness: 5, width: 180, height:50) : ButtonDesign(icon: "globe", title: "URL", borderColor: Color.black, borderThickness: 2, width: 180, height:50)
                    }
                }
            }
            if newObject.imageData.isSaved{
                if newObject.imageData.isURL || newObject.imageData.isDevice{
                    HStack{
                        
                        Button(action:{
                            if newObject.imageData.isURL{
                                newObject.setImageUrlFromString(string: enteredText)
                                newObject.imageData.isDeletable = true
                                newObject.imageData.isSaved = false
                                if isForList{
                                    designData.insertAndAppendInList(object: newObject, type: .picturefromweb)
                                }
                            }
                            else{
                                newObject.setImageFromDevice()
                                newObject.imageData.isDeletable = true
                                newObject.imageData.isSaved = false
                                if isForList{
                                    designData.insertAndAppendInList(object: newObject, type: .picture)
                                }
                            }
                        }){
                            ButtonDesign(icon: "square.and.arrow.down", title: "Save", borderColor: Color.black, borderThickness: 2, width: 180, height:50)
                        }
                    }
                }
            }
            if newObject.imageData.isDeletable{
                Button(action:{
                    newObject.imageData.resetValues()
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
                    newObject.imageData.selectedBackgroundImage = selectedImage
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
