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
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    var QRCodeModelList : QRCodeModel
    @Binding var userDesign: UserDesignList

    var body: some View {
        VStack {
            if let scannedCode = scannedCode {
                SuccessView(userList: $userDesign, message: scannedCode)
            } else {
                Text("\(scannedCode ?? "")")
                    .font(.system(size: 36))
                ButtonDesign(icon: "qrcode.viewfinder", title: "Scan", borderColor: .black, borderThickness: 2, width: 180, height:50)
                    .onTapGesture {
                        isPresentingScanner = true
                    }
                .sheet(isPresented: $isPresentingScanner) {
                    CodeScannerView(codeTypes: [.qr], completion: handleScan)
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
                scannedCode = "Contact already exists"
                return
            }else{
                userDesign.createAndPopulate(components: components)
                scannedCode = "New Contact Added"
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
