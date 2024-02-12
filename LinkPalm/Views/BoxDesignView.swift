//
//  BoxDesignView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import SwiftUI

struct BoxDesignView: View {
    var body: some View {

        ScrollView(showsIndicators: false){
            VStack{
                
                
            }
        }
    }
}

struct BoxDesignButton: View {
    
    var body: some View {
        
        Button(action: {

        }){
            Text("Clear Links")
                .frame(width: 200)
                .font(.system(size: 18))
                .foregroundColor(Color.white)
                .padding(8)
        }
        .background(Color.blue)
        .border(.black, width: 1)
        .cornerRadius(10)
        
    }
}

/*#Preview {
    BoxDesignView()
}*/
