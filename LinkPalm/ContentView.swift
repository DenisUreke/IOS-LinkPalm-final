//
//  ContentView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-07.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        
        NavigationStack{
            MainView()
                .navigationTitle("main")
        }
        
    }
}
