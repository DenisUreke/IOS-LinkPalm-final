//
//  SafariWrapper.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-11.

import Foundation
import SwiftUI
import Observation
import WebKit


struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
           webView.allowsBackForwardNavigationGestures = true
           webView.allowsLinkPreview = true
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}


//WebView(url: "https://www.google.com/")
