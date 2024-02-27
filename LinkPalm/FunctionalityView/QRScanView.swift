//
//  QRScanView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-14.
//
// Taken and adjusted from:
// https://www.hackingwithswift.com "Generating and scaling up a QR code" Paul Hudson, 14 feb 2024

import CodeScanner
import SwiftUI
import SwiftData

struct QRScanView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var qrUsersList: [QRCodeData]
    @State private var isPresentingScanner = true
    @State private var scannedCode: String?
    @Binding var userDesign: UserDesignList

    var body: some View {
        ZStack{
            BackgroundColorView()
            VStack {
                if let scannedCode = scannedCode {
                    SuccessView(userList: $userDesign, message: scannedCode)
                } else {
                    Text("\(scannedCode ?? "")")
                        .font(.system(size: 36))
                    DrawDynamicButton(selectedMenuButton: ShareContactEnum.read)
                        .onTapGesture {
                            isPresentingScanner = true
                        }
                        .sheet(isPresented: $isPresentingScanner) {
                            CodeScannerView(codeTypes: [.qr], completion: handleScan)
                        }
                }
            }
        }
    }

    func handleScan(result: Swift.Result<ScanResult, ScanError>) {
        isPresentingScanner = false
        switch result {
        case .success(let scanResult):
            let components = scanResult.string.split(separator: " ").map(String.init)
            
            if components.count == 4{
                
                let QRModel = QRCodeData(component: components)
                modelContext.insert(QRModel)
                
                scannedCode = checkQRCode(userDesign: userDesign, components: components)
                
            }            
        case .failure(let error):
            scannedCode = "Error \(error)"
            print("Scanning Error: \(error)")
        }
    }
}

func checkQRCode(userDesign: UserDesignList, components: [String]) -> String{
    
    var returnMessage: String  = ""
    
    if userDesign.checkIfContactExists(components: components){
        returnMessage = "Entry already exists"
    }else
    {
        if components[3].lowercased() == "person"{
            userDesign.createAndPopulate(components: components)
            returnMessage = "New Contact Added"
        }
        else if components[3].lowercased() == "item"{
            userDesign.createAndPopulate(components: components)
            returnMessage = "New Product Added"
        }
        else if components[3].lowercased() == "company" {
            userDesign.createAndPopulate(components: components)
            returnMessage = "New Company Added"
        }
        else {
            returnMessage = "Invalid Contact Data"
        }
    }
    return returnMessage
    
}

/*#Preview {
    QRScanView()
}*/
