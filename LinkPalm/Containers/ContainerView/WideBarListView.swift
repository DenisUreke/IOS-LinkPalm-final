//
//  WideBarListView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import SwiftUI

struct WebURL: Identifiable {
    let id = UUID()
    let urlString: String
}

struct WideBarListView: View {
    @Binding var userDesign: WideBarListData
    @State private var webURL: WebURL? = nil

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(userDesign.listOfIcons) { item in
                        // Conditional rendering based on isWebLink
                        if item.isWebLink {
                            Button(action: {
                                self.webURL = WebURL(urlString: item.webAddress)
                            }) {
                                imageContent(for: item, in: geometry)
                            }
                        } else {
                            imageContent(for: item, in: geometry)
                        }
                    }
                }
            }
        }
        .sheet(item: $webURL, onDismiss: { self.webURL = nil }) { webURL in
            // Corrected this closure to use `webURL.urlString`
            WebView(url: URL(string: webURL.urlString) ?? URL(string: "https://www.apple.com/se/")!)
        }
    }

    
    @ViewBuilder
    private func imageContent(for item: WideBarListDataicons, in geometry: GeometryProxy) -> some View {
        Image(systemName: item.sfIcon.rawValue)
            .foregroundColor(item.iconColor.color.opacity(item.iconOpacity))
            .frame(width: (geometry.size.width - (5 * CGFloat(userDesign.listOfIcons.count - 1))) / CGFloat(userDesign.listOfIcons.count), height: 60)
            .background(item.gradientIsClicked ? LinearGradient(gradient: Gradient(colors: [item.backgroundColor.color, item.backgroundColorTwo.color]), startPoint: .top, endPoint: .bottom).opacity(item.backgroundOpacity) : LinearGradient(gradient: Gradient(colors: [item.backgroundColor.color, item.backgroundColor.color]), startPoint: .top, endPoint: .bottom).opacity(item.backgroundOpacity))
            .cornerRadius(8)
            .font(.system(size: item.iconSize))
    }
}

/*#Preview {
    WideBarListView(color: .gray)
}*/
