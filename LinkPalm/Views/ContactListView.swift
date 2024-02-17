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
            ForEach(designList.userList.indices, id: \.self) { index in
                NavigationLink(destination: CardView(user: $designList.userList[index], QRCodeModelList: $QRList)) {
                    drawButtonForContactListView(contact: designList.userList[index])
                        .padding(.vertical, -12)
                }
                .listRowBackground(Color.clear)
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    QRList.listOfContacts.remove(at: index)
                }
            })
        }
    }
}

struct drawButtonForContactListView : View{
    
    let contact : UserDesignModel
    
    var body: some View {
        HStack{
            
            if let urlString = contact.personData?.result.picture.thumbnail, let url = URL(string: urlString) {
                AsyncImage(url: url)
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
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
            } else {
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
            }
            VStack(alignment: .leading){
                Text("\(contact.personData?.result.name.first ?? "Name not found")")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.black)
                Text("\(contact.personData?.result.name.last ?? "")")
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
