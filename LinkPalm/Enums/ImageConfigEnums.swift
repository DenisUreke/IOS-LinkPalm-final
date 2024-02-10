//
//  ImageConfigEnums.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-10.
//

import Foundation
import SwiftUI

enum viewPassedIntoPhotoSelector{
    
    case textView
    
}

enum DynamicViewType {
    case text(Binding<TextBoxDesignData>)
}

extension DynamicViewType {
    @ViewBuilder var view: some View {
        switch self {
        case .text(let titleData):
            TextView(titleData: titleData)
        }
    }
}
