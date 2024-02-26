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
    var QRCodeModelList : QRCodeModel
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
            let QRModel = QRCodeData(component: components)
                modelContext.insert(QRModel)
            
            if userDesign.checkIfContactExists(components: components){
                scannedCode = "Entry already exists"
                return
            }else{
                if components[3] == "person"{
                    userDesign.createAndPopulate(components: components)
                    scannedCode = "New Contact Added"
                }
                else if components[3] == "item"{
                    userDesign.createAndPopulate(components: components)
                    scannedCode = "New Product Added"
                }
                else {
                    userDesign.createAndPopulate(components: components)
                    scannedCode = "New Company Added"
                }
            }
            
        case .failure(let error):
            scannedCode = "Error \(error)"
            print("Scanning Error: \(error)")
        }
    }
}

/*#Preview {
    QRScanView()
}*/
