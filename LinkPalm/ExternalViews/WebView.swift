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

/*
 first ensure background processing and fetch is enabled
 ensure all the following actions are called on webview
      webView.uiDelegate = self     webView.allowsBackForwardNavigationGestures = true     webView.allowsLinkPreview = true     webView.navigationDelegate = self
 then u are good to go
 */


//WebView(url: "https://www.google.com/")
