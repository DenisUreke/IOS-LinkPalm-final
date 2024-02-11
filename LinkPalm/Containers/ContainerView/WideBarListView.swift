//
//  WideBarListView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import SwiftUI

struct WideBarListView: View {
    
    @Binding var userDesign: WideBarListData

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(userDesign.listOfIcons) { item in
                        // Assuming you have a valid URL for each item
                        if let url = URL(string: "https://www.hackingwithswift.com/quick-start/swiftui") {
                            Link(destination: url) {
                                Image(systemName: item.sfIcon.rawValue)
                                    .foregroundColor(item.iconColor.color.opacity(item.iconOpacity))
                                    .frame(width: (geometry.size.width - (5 * CGFloat(userDesign.listOfIcons.count - 1))) / CGFloat(userDesign.listOfIcons.count), height: 60)
                                    .background(item.gradientIsClicked ? LinearGradient(gradient: Gradient(colors: [item.backgroundColor.color, item.backgroundColorTwo.color]), startPoint: .leading, endPoint: .trailing).opacity(item.backgroundOpacity) : LinearGradient(gradient: Gradient(colors: [item.backgroundColor.color, item.backgroundColor.color]), startPoint: .leading, endPoint: .trailing).opacity(item.backgroundOpacity))
                                    .cornerRadius(8)
                                    .font(.system(size: item.iconSize))
                            }
                        }
                    }
                }
            }
        }
    }
}

/*#Preview {
    WideBarListView(color: .gray)
}*/
