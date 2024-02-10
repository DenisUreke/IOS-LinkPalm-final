//
//  PhotoView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import PhotosUI
import SwiftUI

struct PhotoView: View {
    
    @State var test = SFSymbolEnum.bell
    
    @Binding var userDesignModel: UserDesignModel
    @State var viewToShow: ViewPassedIntoPhotoSelector
    @Binding var imageData: ImageData
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @State private var ImageIsChosen = false
    @State private var editImageClicked = false
    @State private var contrast: Double = 0

    var body: some View {
        VStack{
            ZStack{
                VStack{
                    if viewToShow == .textView{
                        TextView(titleData: $userDesignModel)
                    }
                }
            }
                    Divider()
                    //Spacer()
                    
            ScrollView{
                if imageData.selectedBackgroundImage != nil{
                    VStack{
                        Text("Scale to Fill")
                            .font(.system(size: 26, weight: .bold))
                        Image(systemName: !imageData.scaledToFill ? "square" : "square.fill")
                            .font(.system(size: 26))
                    }
                    .onTapGesture {
                        imageData.scaledToFill.toggle()
                    }
                    
                    Divider()
                    
                    Text(EditImageString.contrast.rawValue)
                        .font(.system(size: 26, weight: .bold))
                    Slider(value: $imageData.selectedContrast , in: 0...10)
                    
                    Divider()
                    
                    Text(EditImageString.saturation.rawValue)
                        .font(.system(size: 26, weight: .bold))
                    Slider(value: $imageData.selectedSaturation, in: 0...10)
                    
                    Divider()
                    
                    Text(EditImageString.opacity.rawValue)
                        .font(.system(size: 26, weight: .bold))
                    Slider(value: $imageData.selectedOpacity, in: 0...1)
                    
                    DrawSFSymbolPaletteBox(selectedSFSymbol: $test, title: "Test")
                    
                }
            }
            Spacer()
            PhotosPicker("Select Image", selection: $avatarItem, matching: .images)
            
        }
        .onChange(of: avatarItem) {
            Task {
                if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                    avatarImage = loaded
                    ImageIsChosen.toggle()
                    imageData.selectedBackgroundImage = avatarImage
                } else {
                    print("Failed")
                }
            }
        }
    }
}
