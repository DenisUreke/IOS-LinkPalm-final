//
//  VideoView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import SwiftUI
import WebKit

struct LoadVideoView: View{
    
    let ID : URL
    
    var body: some View{
        VideoView(videoIdentifier: ID)
            .frame(width: 300, height: 220)
            .cornerRadius(12)
            .padding(.horizontal, 24)
            .background(Color.clear)
    }
    
}

struct VideoView: UIViewRepresentable {
    let videoIdentifier: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let youTubeURL = videoIdentifier
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youTubeURL))
    }
}

/*struct Video_Previews: PreviewProvider{
    static var previews: some View{
        TestingView(ID: "3uEbkUmS29A")
    }
}*/

