//
//  textConfigEnums.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-09.
//

import Foundation
import SwiftUI

enum FontSize: String{
    case title1 = "Small"
    case title2 = "Medium"
    case title3 = "Large"
    
    var getFontSize: CGFloat {
        switch self{
        case .title1:
            return 20
        case .title2:
            return 24
        case .title3:
            return 28
        }
    }
}

enum FontStyle: String, CaseIterable{
    case defaults = "Default"
    case monoSpaced = "MonoSpaced"
    case serif = "Serif"
    
    var getFontStyel: Font.Design{
        switch self{
        case .defaults:
            return .default
        case .monoSpaced:
            return .monospaced
        case .serif:
            return .serif
        }
    }
}

enum FontWeight: String, CaseIterable{
    case regularWeight = "Regular"
    case semiBoldWeight = "Semi-Bold"
    case boldWeight = "Bold"
    
    var getWeight: Font.Weight{
        switch self{
        case .regularWeight:
            return .regular
        case .semiBoldWeight:
            return .semibold
        case .boldWeight:
            return .bold
        }
    }
}

enum FontTextAlignment: String{
    case TextAlignmentLeft = "Leading"
    case TextAlignmentCenter = "Centered"
    case TextAlignmentRight = "Trailing"
    
    var getTextAlignment: TextAlignment{
        switch self{
        case .TextAlignmentLeft:
            return .leading
        case .TextAlignmentCenter:
            return .center
        case .TextAlignmentRight:
            return .trailing
        }
    }
}

enum FontAlignment: String{
    case alignmentLeft = "Left-Aligned"
    case alignmentCenter = "Centered"
    case alignmentRight = "Right-Aligned"
    
    var getAlignment: Alignment{
        switch self{
        case .alignmentLeft:
            return .leading
        case .alignmentCenter:
            return .center
        case .alignmentRight:
            return .trailing
        }
    }
}

enum headerTitleString: String{
    
    case fontSize = "Font-Size"
    case fontWeight = "Weight"
    case fontStyle = "Size"
    case fontColor = "Font-Color"
    case backgroundColor = "Background-Color"
    case setBorderColor = "Border"
    case alignment = "Alignment"
    case textAlignment = "Text Origin"
    case backgroundColorsRadient = "Second Color"
    case iconColor = "Icon-Color"
    case iconSize = "Icon-Size"
    case sfSymbolList = "Icon"
    
}
