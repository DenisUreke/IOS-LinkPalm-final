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

struct QrCodeReader: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    @Binding var QRCodeModelList : QRCodeModel

    var body: some View {
        VStack {
            if let scannedCode = scannedCode {
                Text("Scanned code: \(scannedCode)")
            } else {
                ButtonDesign(icon: "qrcode.viewfinder", title: "Scan", borderColor: .black, borderThickness: 2)
                    .onTapGesture {
                        isPresentingScanner = true
                    }
                    .scaleEffect(2)
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
            QRCodeModelList.createContactAndAppend(components: components)
            scannedCode = scanResult.string
        case .failure(let error):
            // Handle the scanning error
            print("Scanning Error: \(error)")
        }
    }
}

/*#Preview {
    QRScanView()
}*/
