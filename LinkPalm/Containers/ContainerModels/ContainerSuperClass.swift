//
//  ContainerSuperClass.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-08.
//

import Foundation
import Observation
import SwiftUI

@Observable
class ContainerSuperClass{
    
    var typeOfContainer: TypeOfContainer = .text
    var backgroundColor: Color = .blue
    var isInEditMode: Bool = true
    
}


