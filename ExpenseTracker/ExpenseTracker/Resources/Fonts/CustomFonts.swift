import Foundation
import SwiftUI

enum CustomFonts: String {
    case ubuntu = "Ubuntu"
    case roboto = "Roboto"
}

struct FontBuilder {
    let font: Font
    let weight: Font.Weight
    let tracking: Double
    let lineSpacing: Double
    let verticalPadding: Double
    
    init(
        customFonts: CustomFonts,
        fontSize: Double,
        weight: Font.Weight = .regular,
        lineSpacing: Double = 1,
        lineHeight: Double
    ) {
        self.weight = weight
        self.font = Font.custom(customFonts,size: fontSize).weight(weight)
        self.tracking = fontSize * lineSpacing
        let uiFont = UIFont(name: customFonts.rawValue, size: fontSize) ?? .systemFont(ofSize: fontSize)
        self.lineSpacing = lineHeight - uiFont.lineHeight
        self.verticalPadding = lineSpacing / 2
    }
    
}


extension FontBuilder {
    static let title = FontBuilder(
        customFonts: .ubuntu,
        fontSize: 18,
        lineHeight: 24.0)
    
    static let titleToday = FontBuilder(
        customFonts: .roboto,
        fontSize: 18,
        weight: .bold,
        lineHeight: 26.0)
}

extension Font {
    
    static func custom(_ customFonts: CustomFonts, size: CGFloat) -> Font {
        Font.custom(customFonts.rawValue, size: size)
    }
    
}

extension Text {
    
    func font(_ customFonts: CustomFonts, size: CGFloat) -> Text {
        self.font(Font.custom(customFonts.rawValue, size: size))
    }
}
