//
//  SafariWrapper.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-11.
//https://designcode.io/swiftui-handbook-safari-inside-app

import Foundation
import SwiftUI
import SafariServices
import Observation

struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}

@Observable
class GlobalSettings: ObservableObject {
    @State static var shared = GlobalSettings()
    var startSafari: Bool = false
}

