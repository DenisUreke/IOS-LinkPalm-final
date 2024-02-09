//
//  loremIpsum.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-07.
//

import Foundation

func generatePlaceholderText(wordCount: Int) -> String {
    
    let words = ["lorem", "ipsum", "dolor", "sit", "amet", "consectetur", "adipiscing", "elit", "sed", "do", "eiusmod", "tempor", "incididunt", "ut", "labore", "et", "dolore", "magna", "aliqua"]
    var placeholderText = "Lorem "
    
    for _ in 0..<wordCount {
        if let randomWord = words.randomElement() {
            placeholderText += randomWord + " "
        }
    }
    placeholderText += "."
    
    return placeholderText.trimmingCharacters(in: .whitespaces)
}
