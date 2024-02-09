//
//  QuarterScreenTextView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-07.
//

import SwiftUI

struct QScreenTxtView: View {
    
    @Binding var settings : QScreenTxtModel
    
    var body: some View {
        ZStack(alignment: .center){
            VStack{
                Text("Title")
                    .foregroundColor(.black)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .scaleEffect(1)
            .background(settings.backgroundColor)
            //.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
}

/*#Preview {
    QScreenTxtView()
}*/
