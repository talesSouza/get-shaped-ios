import Foundation

enum ActivityLevel: String, CaseIterable {
    
    case highLevel = "High level"
    case athletic = "Athletic"
    case moderate = "Moderate"
    case smooth = "Smooth"
    case sedentary = "Sedentary"
    
    var multiplier: Double {
        switch self {
        case .highLevel:
            return 1.9
        case .athletic:
            return 1.725
        case .moderate:
            return 1.55
        case .smooth:
            return 1.375
        case .sedentary:
            return 1.2
        }
    }
}
