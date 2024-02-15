//
//  ContentView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-07.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var testing = DownloadDataModel()
    

    var body: some View {
        
        //Text("Size \(testing.imagesData.count)")
        
        NavigationStack{
            MainView()
                .navigationTitle("contact")
        }
        
    }
        /*NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
                
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .task{
                await fetchData()
            }
        }
        
    detail: {
            Text("Select an item")
        }*/
        
        
    }
    
/*
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    func fetchData() async {
        do {
            try await testing.fetchPersonData()
        } catch {
            print("Error fetching data: \(error)")
        }
        do {
            try await testing.fetchImageData()
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}
*/
/*#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}*/
