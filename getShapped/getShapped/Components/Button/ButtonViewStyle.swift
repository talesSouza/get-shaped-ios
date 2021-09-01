import UIKit

enum ButtonViewStyle {
    case primary
    case secondary
    
    var textStyle: TextStyle {
        switch self {
        case .primary:
            return TextStyle()
        case .secondary:
            return TextStyle(color: .white, size: .p12, weight: .semiBold)
        }
    }
    
    var background: UIColor { return .clear }
}
