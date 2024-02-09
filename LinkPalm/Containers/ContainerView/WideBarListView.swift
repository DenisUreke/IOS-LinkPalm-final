//
//  WideBarListView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import SwiftUI

struct WideBarListView: View {
    
    @State var model = WideBarListModel()
    var color : Color

    var body: some View {
        
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(model.listOfIcons) { item in
                        Image(systemName: item.sfIcon)
                            .frame(width: (geometry.size.width - (5 * CGFloat(model.listOfIcons.count - 1))) / CGFloat(model.listOfIcons.count), height: 60)
                            .background(color)
                            .cornerRadius(8)
                            .font(.system(size: 36))
                        
                    }
                }
            }
        }
    }
}

#Preview {
    WideBarListView(color: .gray)
}
