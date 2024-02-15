//
//  ContactsListView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-15.
//

import SwiftUI

struct ContactsListView: View {
    
    @Binding var QRList: QRCodeModel
    @Binding var designList: UserDesignList
    
    var body: some View {
        List {
            ForEach(QRList.listOfContacts) { contact in
                let index = findUserDesignModel(forID: contact.ID)
                if index != -666 {
                    NavigationLink(destination: CardView(titleData: $designList.userList[index], QRCodeModelList: $QRList)) {
                        drawButtonForContactListView(person: contact)
                            .padding(.vertical, -12)
                    }
                    .listRowBackground(Color.clear)
                } else {
                    EmptyView()
                }
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    QRList.listOfContacts.remove(at: index)
                }
            })
        }
    }

    private func findUserDesignModel(forID id: String) -> Int {
        return designList.userList.firstIndex(where: { $0.userID == id }) ?? -666
    }
}

struct drawButtonForContactListView : View{
    
    let person: QRCodeData
    
    var body: some View {
        HStack{
            Image(systemName: "person.circle")
                .foregroundColor(.blue)
                .font(.largeTitle)
                .frame(width: 40, height: 40)
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                        .fill(Color.white)
                        .frame(width: 64, height: 64)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                                .stroke(Color.black, lineWidth: 1)))
                .shadow(color: .gray, radius: 10, x: 0, y: 4)
                .padding(.trailing, 20)
                .padding(.leading, -20)
            VStack(alignment: .leading){
                    Text("\(person.firstName)")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.black)
                    Text("\(person.lastName)")
                        .font(.system(size: 14))
                        .foregroundStyle(Color.black)
                }
            Spacer()
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.gray.opacity(0.1))
                .frame(width: 330, height: 80)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(Color.black, lineWidth: 1)))
        .padding()
    }
    
}

/*#Preview {
    ContactsListView()
}*/
