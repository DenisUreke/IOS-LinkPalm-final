//
//  VideoDesignView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-13.
//

import SwiftUI

struct VideoDesignView: View {
    
    @Binding var designData: ImageVideoData
    @State var enteredText: String = ""
    
    var body: some View{
    
        VStack{
            LoadVideoView(ID: designData.videoID)
        }
        .onDisappear {
            if designData.imageData.isURL{
                designData.setTypeOfBox(type: .video)
            }
            else{
                designData.setTypeOfBox(type: .picture)
            }
        }
        
        Divider()
        
        VStack {
            TextField("Enter URL", text: $enteredText)
                .frame(width: 300)
         .padding()
         .multilineTextAlignment(.center)
         .border(Color.gray)
         }
        
        DynamicButtonWithFunction(
            icon: "square.and.arrow.down", title: "Save",action: {designData.setVideoUrlFromString(string: enteredText)})
        
    }
}

/*#Preview {
    VideoDesignView()
}*/
