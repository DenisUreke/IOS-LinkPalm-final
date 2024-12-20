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
    @State private var videoURL: WebURL? = nil
    @Binding var isEditMode : Bool

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(userDesign.listOfIcons) { item in
                        // Conditional rendering based on isWebLink
                        if item.isWebLink {
                            if !isEditMode{
                                Button(action: {
                                    self.webURL = WebURL(urlString: item.webAddress)
                                }) {
                                    imageContent(for: item, in: geometry)
                                }
                            }
                            else{
                                imageContent(for: item, in: geometry)
                            }
                        }else if item.isVideoLink {
                            if !isEditMode{
                                Button(action: {
                                    self.videoURL = WebURL(urlString: item.webAddress)
                                }) {
                                    imageContent(for: item, in: geometry)
                                }
                            }
                            else{
                                imageContent(for: item, in: geometry)
                            }
                        }else {
                            imageContent(for: item, in: geometry)
                        }
                    }
                }
            }
        }
        .sheet(item: $webURL, onDismiss: { self.webURL = nil }) { webURL in
            WebView(url: URL(string: webURL.urlString) ?? URL(string: "https://www.apple.com/se/")!)
        }
        .sheet(item: $videoURL, onDismiss: { self.videoURL = nil }) { videoURL in
            LoadVideoView(ID: URL(string: videoURL.urlString) ?? URL(string: "https://www.youtube.com/watch?v=3uEbkUmS29A")!)
        }
    }

    
    @ViewBuilder
    private func imageContent(for item: WideBarListDataicons, in geometry: GeometryProxy) -> some View {
        ZStack{
            Image(systemName: item.sfIcon.rawValue)
                .foregroundColor(item.iconColor.color.opacity(item.iconOpacity))
                .frame(width: (geometry.size.width - (5 * CGFloat(userDesign.listOfIcons.count - 1))) / CGFloat(userDesign.listOfIcons.count), height: 60)
                .background(item.gradientIsClicked ? LinearGradient(gradient: Gradient(colors: [item.backgroundColor.color, item.backgroundColorTwo.color]), startPoint: .top, endPoint: .bottom).opacity(item.backgroundOpacity) : LinearGradient(gradient: Gradient(colors: [item.backgroundColor.color, item.backgroundColor.color]), startPoint: .top, endPoint: .bottom).opacity(item.backgroundOpacity))
                .cornerRadius(8)
                .font(.system(size: item.iconSize))

                Text("\(item.text)")
                    .frame(maxWidth: .infinity, alignment: item.selectedAlignment.getAlignment)
                    .multilineTextAlignment(item.selectedTextAlignment.getTextAlignment)
                    .padding([.leading, .trailing], 10)
                    .frame(width: (geometry.size.width - (5 * CGFloat(userDesign.listOfIcons.count - 1))) / CGFloat(userDesign.listOfIcons.count), height: 60)
            .font(.system(size: item.selectedSize, weight: item.selectedWeight.getWeight, design: item.selectedStyle.getFontStyel))
            .opacity(item.selectedFontOpacity)
            .foregroundColor(item.selectedColorFont.color)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .shadow(color: !item.shadowIsClicked ? .clear : .gray,
                    radius: 2,x: 0, y: !item.shadowIsClicked ? 0 : 5)

        }
        .clipped()
    }
}

struct WideBarListViewForEdit: View{
    
    @Binding var userDesign: WideBarListData
    //@State private var selectedIndex: String?
    @Binding var indexOfButton: Int
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(Array(userDesign.listOfIcons.enumerated()), id: \.element.id) { index, item in
                        Button(action: {
                            self.indexOfButton = index
                        }) {
                            imageContent(for: item, in: geometry)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(self.indexOfButton == index ? Color.blue : Color.clear, lineWidth: 5)
                                )
                        }
                    }
                }
            }
        }
    }

    
    @ViewBuilder
    private func imageContent(for item: WideBarListDataicons, in geometry: GeometryProxy) -> some View {
        ZStack{
            Image(systemName: item.sfIcon.rawValue)
                .foregroundColor(item.iconColor.color.opacity(item.iconOpacity))
                .frame(width: (geometry.size.width - (5 * CGFloat(userDesign.listOfIcons.count - 1))) / CGFloat(userDesign.listOfIcons.count), height: 60)
                .background(item.gradientIsClicked ? LinearGradient(gradient: Gradient(colors: [item.backgroundColor.color, item.backgroundColorTwo.color]), startPoint: .top, endPoint: .bottom).opacity(item.backgroundOpacity) : LinearGradient(gradient: Gradient(colors: [item.backgroundColor.color, item.backgroundColor.color]), startPoint: .top, endPoint: .bottom).opacity(item.backgroundOpacity))
                .cornerRadius(8)
                .font(.system(size: item.iconSize))

                Text("\(item.text)")
                    .frame(maxWidth: .infinity, alignment: item.selectedAlignment.getAlignment)
                    .multilineTextAlignment(item.selectedTextAlignment.getTextAlignment)
                    .padding([.leading, .trailing], 10)
                    .frame(width: (geometry.size.width - (5 * CGFloat(userDesign.listOfIcons.count - 1))) / CGFloat(userDesign.listOfIcons.count), height: 60)
            .font(.system(size: item.selectedSize, weight: item.selectedWeight.getWeight, design: item.selectedStyle.getFontStyel))
            .opacity(item.selectedFontOpacity)
            .foregroundColor(item.selectedColorFont.color)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .shadow(color: !item.shadowIsClicked ? .clear : .gray,
                    radius: 2,x: 0, y: !item.shadowIsClicked ? 0 : 5)

        }
        .clipped()
    }
    
}


/*#Preview {
    WideBarListView(color: .gray)
}*/
