//
//  ImagesURLModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-07.
//

import Foundation
import Observation

@Observable
class ImageURLModel{
    
    let url: URL?
    
    init(url: String){
        self.url = URL(string: url)
    }
}
