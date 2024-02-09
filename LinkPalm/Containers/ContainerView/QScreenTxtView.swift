//
//  QuarterScreenTextView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-07.
//

import SwiftUI

struct QuarterScreenTextView: View {
    
    var settings : QScreenTxtModel = QScreenTxtModel()
    
    var body: some View {
        ZStack(alignment: .center){
            Color(settings.backgroundColor)
            VStack{
                Text("Title")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
            }
        }
    }
}

#Preview {
    QuarterScreenTextView()
}
