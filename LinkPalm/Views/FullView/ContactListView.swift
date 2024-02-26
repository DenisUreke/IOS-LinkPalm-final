//
//  ContactsListView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-15.
//

import SwiftUI
import SwiftData

struct ContactsListView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query private var qrUsersList: [QRCodeData]
    
    @Binding var designList: UserDesignList
    @State var filter : TypeOfContact = .none
    
    var body: some View {
        
        ZStack{
            BackgroundColorView()
            
            VStack{
                List {
                    ForEach(designList.userList.indices, id: \.self) { index in
                        if filter == designList.userList[index].typeOfContact || filter == .none{
                            NavigationLink(destination: CardView(user: $designList.userList[index])) {
                                drawButtonForContactListView(contact: designList.userList[index])
                                    .padding(.vertical, -12)
                            }
                            .listRowBackground(Color.clear)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            modelContext.delete(qrUsersList[index])
                            designList.userList.remove(at: index)
                        }
                    })
                }
                .scrollContentBackground(.hidden)
                
                Spacer()
                drawButtonForSorting(filter: $filter)
                    .padding(.bottom, 20)
            }
        }
    }
}


struct drawButtonForSorting: View{
    
    @Binding var filter : TypeOfContact
    
    var body: some View{

            HStack(spacing: 10){
                ForEach(TypeOfContact.allCases, id: \.self) { type in
                    Button(action:{
                        filter = type
                    })
                    {
                        buttonDesignForSorting(icon: type.asIcon)
                    }
                }
            }
    }
}

struct buttonDesignForSorting: View{
    var icon : String
    
    var body: some View{
        
        Image(systemName: icon )
            .foregroundColor(.blue)
            .font(.title)
            .frame(width: 35, height: 35)
            .background(
                RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                    .fill(Color.white)
                    .frame(width: 55, height: 55)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                            .stroke(Color.black, lineWidth: 1)))
            .shadow(color: .gray, radius: 10, x: 0, y: 4)
            .padding(.trailing, 15)
            .padding(.leading, 15)
    }
}

struct drawButtonForContactListView : View{
    
    let contact : UserDesignModel
    var userDetails: (firstName: String, lastName: String, imageURL: String, typeOfContactSymbol: String)
    
    init(contact: UserDesignModel) {
        self.contact = contact
        self.userDetails = contact.returnCorrectValuesAccordingToEnum(data: contact, typeOfContact: contact.typeOfContact)
    }
    
    var body: some View {
        
        HStack{
            if !userDetails.imageURL.isEmpty {
                AsyncImage(url: URL(string: userDetails.imageURL))
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
                if contact.typeOfContact == .person{
                    Text("\(userDetails.firstName )")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.black)
                    Text("\(userDetails.lastName)")
                        .font(.system(size: 14))
                        .foregroundStyle(Color.black)
                }
                else{
                    Text("\(userDetails.firstName )")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.black)
                }
            }
            Spacer()
            Image(systemName: "\(userDetails.typeOfContactSymbol)")
                .foregroundColor(Color.blue)
                .font(.system(size: 28))
                .offset(x: 30)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.white)
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
