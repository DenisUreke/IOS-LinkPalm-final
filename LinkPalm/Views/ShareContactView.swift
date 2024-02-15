//
//  QRSwitchView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-15.
//

import SwiftUI

struct ShareContactView: View {

    var user: UserDesignModel
    var QRmodel: QRCodeModel
    
    var body: some View {
        
        HStack{
            LazyVGrid(columns: [GridItem(.flexible())]) {
                ForEach(ShareContactEnum.allCases, id: \.self) { object in
                    NavigationLink(destination: self.destinationView(menu: object)) {
                        drawButtonForQRSwitchMenu(selectedMenuButton: object)
                    }
                }
            }
        }
        
    }
    @ViewBuilder
    private func destinationView(menu: ShareContactEnum) -> some View {
        switch menu {
        case .create:
            QRCreateView(personID: user)
        case .read:
            QRScanView(QRCodeModelList: QRmodel)
        case .peer:
            QRScanView(QRCodeModelList: QRmodel)
        }
    }
    
}
struct drawButtonForQRSwitchMenu : View{
    
    var selectedMenuButton: ShareContactEnum
    
    var body: some View {
        HStack{
            Image(systemName: "\(selectedMenuButton.sfSymbol)")
                .foregroundColor(.blue)
                .font(.largeTitle)
                .frame(width: 50, height: 50)
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                        .fill(Color.white)
                        .frame(width: 80, height: 80)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                                .stroke(Color.black, lineWidth: 1)))
                .shadow(color: .gray, radius: 10, x: 0, y: 4)
            Spacer()
            Text("\(selectedMenuButton.rawValue)")
                .font(.title2)
                .foregroundStyle(Color.black)
            Spacer()
            Image(systemName: "arrowtriangle.right")
                .foregroundColor(.black)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.gray.opacity(0.1))
                .frame(width: 360, height: 100)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(Color.black, lineWidth: 1)))
        .padding()
    }
    
}
/*#Preview {
    QRSwitchView()
}*/
