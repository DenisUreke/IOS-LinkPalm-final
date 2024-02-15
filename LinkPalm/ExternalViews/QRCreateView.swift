//
//  QRcodeView.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-14.
//
// Taken from:
// https://www.hackingwithswift.com "Generating and scaling up a QR code" Paul Hudson, 14 feb 2024

import CoreImage.CIFilterBuiltins
import SwiftUI

struct QRCreateView: View {
    
    let personID : UserDesignModel
    
    let context = CIContext()
    let imageFilter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        Image(uiImage: generateQRCode(from: "\(personID.userID) \(personID.firstName) \(personID.lastName) \(personID.typeOfContact)"))
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
    
    func generateQRCode(from string: String) -> UIImage {
        imageFilter.message = Data(string.utf8)

        if let outputImage = imageFilter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}



/*#Preview {
    QRcodeView(personID: UserDesignModel())
}*/
