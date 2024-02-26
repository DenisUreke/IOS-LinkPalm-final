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
        ZStack{
            BackgroundColorView()
            Image(uiImage: generateQRCode(from: "\(personID.ID) John Doe \(personID.typeOfContact)"))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .gray, radius: 5, x: 0, y: 2)
                .offset(y: -130)
        }
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
