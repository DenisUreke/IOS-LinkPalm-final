//
//  ImageVideoListView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import SwiftUI

struct ImageVideoListView: View {
    
    @Binding var designData : UserDesignModel
    
    var design: ImageVideoDataList {
        return self.designData.boxOne.imageVideoListData
    }
    
    var body: some View {

        List {
            ForEach(design.listOfEntries) { entry in
                getDynamicView(entry.typeOfBox, designData: entry)
                
            }
        }
    }

func getDynamicView(_ type: ImageVideoEnum, designData: Binding<UserDesignModel>) -> some View {
    
    switch type {
    case .none:
        return AnyView(EmptyView())
    case .title:
        return AnyView(TextViewTitle(titleData: designData))
    case .text:
        return AnyView(TextViewText(titleData: designData))
    case .video:
        // Assuming you have a specific view for videos, replace TextViewText with that
        return AnyView(TextViewText(titleData: designData)) // Example placeholder
    case .picture:
        // Assuming you have a specific view for pictures, replace TextViewText with that
        return AnyView(TextViewText(titleData: designData)) // Example placeholder
    }
}






/*#Preview {
    ImageVideoListView()
}*/
