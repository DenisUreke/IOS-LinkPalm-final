//
//  ImageVideoListView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-12.
//

import SwiftUI

struct BoxView: View {
    
    @Binding var titleData : ImageVideoDataList
    @State var isEditMode : Bool = false
    
    var body: some View {
        
        ZStack {
            Color(titleData.backgroundData.selectedColorBackgroundOne.color)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0){
                ImageVideoListView(list: $titleData)
            }
            .padding(.horizontal, -20)
            .border(titleData.backgroundData.selectedBorderColor.color, width: titleData.backgroundData.selectedBorderWidth)
            .background(titleData.backgroundData.gradientIsClicked ? Gradient(colors: [titleData.backgroundData.selectedColorBackgroundOne.color, titleData.backgroundData.selectedColorBackgroundTwo.color]).opacity(titleData.backgroundData.selectedBackgroundOpacity) : Gradient(colors: [titleData.backgroundData.selectedColorBackgroundOne.color, titleData.backgroundData.selectedColorBackgroundOne.color]).opacity(titleData.backgroundData.selectedBackgroundOpacity) )
            .cornerRadius(titleData.backgroundData.selectedCornerRadius)
            .toolbar {
                drawToolBar()
            }
        }
        
        if isEditMode{
            NavigationLink(destination: BoxDesignView(designData: $titleData)){
                DrawDynamicButton(selectedMenuButton: ButtonEnum.add)
            }
        }
    
    }
    private func drawToolBar()-> some ToolbarContent{
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            Menu {
                Button(action: {
                    self.isEditMode.toggle()
                }) {
                    Label(isEditMode ? "Exit Edit Mode" : "Edit Mode", systemImage: isEditMode ? "xmark.circle" : "square.and.pencil")
                }
            } label: {
                Label("Menu", systemImage: "line.3.horizontal")
            }
        }
    }
}

struct ImageVideoListView: View {
    
    @Binding var list: ImageVideoDataList
    @State var idOfEditingItem: String?
    @State var navigate: Bool = false
    
    var body: some View {
        List {
            ForEach($list.listOfEntries, id: \.id) { $entry in
                VStack {
                    getDynamicView(imageVideoData: $entry, type: entry.typeOfBox)
                        .background(list.backgroundData.gradientIsClicked ? LinearGradient(gradient: Gradient(colors: [list.backgroundData.selectedColorBackgroundOne.color, list.backgroundData.selectedColorBackgroundTwo.color]), startPoint: .top, endPoint: .bottom).opacity(list.backgroundData.selectedBackgroundOpacity) : LinearGradient(gradient: Gradient(colors: [list.backgroundData.selectedColorBackgroundOne.color, list.backgroundData.selectedColorBackgroundOne.color]), startPoint: .top, endPoint: .bottom).opacity(list.backgroundData.selectedBackgroundOpacity))
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        if let index = list.listOfEntries.firstIndex(where: { $0.id == entry.id }) {
                            list.listOfEntries.remove(at: index)
                        }
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    Button {
                        idOfEditingItem = entry.id
                        navigate = true
                    } label: {
                        Label("Edit", systemImage: "square.and.pencil")
                    }
                    .tint(.blue)
                }
            }
        }
        .navigationDestination(isPresented: $navigate) {
            if let id = idOfEditingItem, let index = list.listOfEntries.firstIndex(where: { $0.id == id }) {
                DynamicView(data: $list.listOfEntries[index], dataList: $list)
            } else {
                Text("Item not found or was deleted.") // change this to something smarter later
            }
        }
    }
}

func getDynamicView(imageVideoData: Binding<ImageVideoData>, type: ImageVideoEnum) -> some View {
    
    switch type {
    case .none:
        return AnyView(EmptyView())
    case .text:
        return AnyView(DynamicViewText(titleData: imageVideoData.textCustomModel))
    case .video:
        return AnyView(LoadVideoView(ID: imageVideoData.videoID.wrappedValue))
    case .picture:
        return AnyView(DynamicPictureView(imageData: imageVideoData))
    case .picturefromweb:
        return AnyView(DynamicPictureViewFromWeb(imageData: imageVideoData))
    }
}

struct DynamicButtonForEditing: View {
    
    @Binding var data: ImageVideoData
    @Binding var dataList: ImageVideoDataList
    
    var body: some View {
        
        switch data.typeOfBox {
        case .picture, .picturefromweb:
            NavigationLink {
                PhotoView(designData: $dataList, newObject: $data, isForList: true)
            } label: {
                ButtonDesign(icon: "square.and.pencil", title: "Edit", borderColor: .black, borderThickness: 2, width: 180, height: 50)
            }
        case .text:
            NavigationLink {
                configurateTextObjects(titleData: $dataList, data: $data)
            } label: {
                ButtonDesign(icon: "square.and.pencil", title: "Edit", borderColor: .black, borderThickness: 2, width: 180, height: 50)
            }
        case .video:
            NavigationLink {
                VideoDesignView(list: $dataList, designData: $data)
            } label: {
                ButtonDesign(icon: "square.and.pencil", title: "Edit", borderColor: .black, borderThickness: 2, width: 180, height: 50)
            }
        case .none:
            EmptyView()
        }
        
    }
}

struct DynamicView: View {
    
    @Binding var data: ImageVideoData
    @Binding var dataList: ImageVideoDataList

    @ViewBuilder var editingView: some View {
        switch data.typeOfBox {
        case .picture, .picturefromweb:
            PhotoView(designData: $dataList, newObject: $data, isForList: true)
        case .text:
            configurateTextObjects(titleData: $dataList, data: $data)
        case .video:
            VideoDesignView(list: $dataList, designData: $data)
        case .none:
            EmptyView()
        }
    }
    
    var body: some View {
        editingView
    }
}







/*#Preview {
    ImageVideoListView()
}*/
