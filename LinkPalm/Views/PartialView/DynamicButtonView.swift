//
//  DynamicButton.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-24.
//

import SwiftUI

struct DrawDynamicButton<MenuButton: MenuButtonRepresentable> : View {
    
    var selectedMenuButton: MenuButton
    
    var body: some View {
        ZStack{
            Image(systemName: selectedMenuButton.sfSymbol)
                .foregroundColor(.blue)
                .font(.largeTitle)
                .frame(width: 60, height: 60)
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                        .fill(Color.white)
                        .frame(width: 90, height: 90)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                                .stroke(Color.black, lineWidth: 1)))
            Text(selectedMenuButton.displayName)
                .font(.system(size: 12))
                .frame(width: 60)
                .lineLimit(1)
                .foregroundStyle(Color.black)
                .offset(y:30)
                .minimumScaleFactor(0.5)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.blue.opacity(0.3))
                .frame(width: 120, height: 120)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(Color.black, lineWidth: 1)))
        .padding(.bottom, 45)
        .shadow(color: .gray, radius: 10, x: 0, y: 4)
    }
    
}
