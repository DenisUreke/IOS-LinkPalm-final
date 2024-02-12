//
//  VideoView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import SwiftUI
import WebKit

struct TestingView: View{
    
    let ID : String = "3uEbkUmS29A"
    
    var body: some View{
        VideoView(videoIdentifier: ID)
            .frame(width: 350, height: 190)
    }
    
}

struct VideoView: UIViewRepresentable {
    let videoIdentifier: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youTubeURL = URL(string: "https://www.youtube.com/embed/\(videoIdentifier)") else { return }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youTubeURL))
    }
}

/*struct Video_Previews: PreviewProvider{
    static var previews: some View{
        TestingView(ID: "3uEbkUmS29A")
    }
}*/

