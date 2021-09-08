import UIKit

class TextBuilder {
    
    func buildText(text: String, style: TextStyle) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = style.aligment
        
        return NSMutableAttributedString (string: text, attributes: [NSAttributedString.Key.font: getKailasa(withSize: style.size.rawValue, weight: style.weight),
                                                                     NSAttributedString.Key.foregroundColor: style.color,
        ])
    }
}

// MARK: - Private Methods
extension TextBuilder {
    private func getKailasa(withSize size: CGFloat, weight: TextBuilderFontWeight) -> UIFont {
        let baseName = "Kailasa"
        return UIFont(name: baseName + weight.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
