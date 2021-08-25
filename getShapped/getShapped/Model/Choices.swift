import UIKit

enum Choices: Int {
    case thinner = 0
    case preserve = 1
    case stronger = 2
    
    var calc: Double {
        switch self {
        case .thinner:
            return -500
        case .preserve:
            return 0
        case .stronger:
            return 500
        }
    }
}

