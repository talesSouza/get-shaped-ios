import UIKit

// MARK: - Computed Properties
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

// MARK: - Public Methods
extension String {
    func setUnderlined() -> NSAttributedString {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        return NSAttributedString(string: self, attributes: underlineAttribute)
    }
}
