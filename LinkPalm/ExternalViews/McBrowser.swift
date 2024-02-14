//
//  McBrowser.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-14.
//

import SwiftUI
import MultipeerConnectivity

struct BrowserView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    var session: MCSession
    
    func makeUIViewController(context: Context) -> MCBrowserViewController {
        let browser = MCBrowserViewController(serviceType: "your-service-type", session: session)
        browser.delegate = context.coordinator
        return browser
    }
    
    func updateUIViewController(_ uiViewController: MCBrowserViewController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MCBrowserViewControllerDelegate {
        var parent: BrowserView
        
        init(_ parent: BrowserView) {
            self.parent = parent
        }
        
        func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
