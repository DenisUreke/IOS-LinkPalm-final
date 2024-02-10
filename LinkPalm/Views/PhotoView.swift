//
//  PhotoView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import PhotosUI
import SwiftUI

struct PhotoView: View {
    
    @Binding var userDesignModel: UserDesignModel
    // ADD THE IMAGEDATE NEEDED <-------------------------------
    @State var viewToShow: ViewPassedIntoPhotoSelector
    @Binding var imageData: ImageData
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @State private var ImageIsChosen = false
    @State private var saturation: Double = 0
    @State private var contrast: Double = 0

    var body: some View {
        VStack {
            
            if viewToShow == .textView{
                VStack{
                    VStack{
                        TextView(titleData: $userDesignModel)
                    }
                    .scaleEffect(0.5)
                    .offset(y: -200)
                    Spacer()
                }
            }
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
