//
//  VideoDesignView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-13.
//

import SwiftUI

struct VideoDesignView: View {
    
    @Binding var list: ImageVideoDataList
    @Binding var designData: ImageVideoData
    @State var enteredText: String = ""
    
    var body: some View{
    
        VStack{
            LoadVideoView(ID: designData.videoID)
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
            icon: "square.and.arrow.down", title: "Save",action: {list.setVideoUrlFromString(string: enteredText, data: designData)})
        
    }
}

/*#Preview {
    VideoDesignView()
}*/
