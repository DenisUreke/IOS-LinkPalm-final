//
//  MedeModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-16.
//

import Foundation

class MemeModel {
    let title: String
    let url: URL?
    
    init(title: String, url: String) {
        self.title = title
        self.url = URL(string: url)
    }
}
