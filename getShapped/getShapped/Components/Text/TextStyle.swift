import UIKit

enum TextBuilderFontSize: CGFloat {
    case p15 = 15
    case p12 = 12
}

enum TextBuilderFontWeight: String {
    case bold = "Bold"
    case semiBold = "Regular"
}

struct TextStyle {
    var color: UIColor = .black
    var size: TextBuilderFontSize = .p15
    var weight: TextBuilderFontWeight = .bold
    var aligment: NSTextAlignment = .center
}
