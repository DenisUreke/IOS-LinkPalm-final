//
//  WideBarView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import SwiftUI

struct WideBarView: View {
    var color : Color
    
    var body: some View {
        HStack{
            Color(color)
        }
        .frame(height: 60)
    }
}

#Preview {
    WideBarView(color: .blue)
}
