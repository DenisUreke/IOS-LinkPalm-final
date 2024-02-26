//
//  Extensions.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-11.
//

import Foundation
import SwiftUI

extension Image {
    init(sfSymbol: SFSymbolEnum) {
        self.init(systemName: sfSymbol.rawValue)
    }
}

extension View {
    @ViewBuilder func conditionalTapGesture(apply: Bool, action: @escaping () -> Void) -> some View {
        if apply {
            self.onTapGesture(perform: action)
        } else {
            self
        }
    }
}

extension View {
    @ViewBuilder
    func conditionalScaledToFill(apply: Bool) -> some View {
        if apply {
            self
                .scaledToFill()
        }else{
            self
                //.scaledToFit()
        }
    }
}
