import Foundation

enum Macro: Int {
    case carb = 0
    case fat = 1
    case protein = 2
    
    var percentage: Double {
        switch self {
        case .carb:
            return 0.35
        case .fat:
            return 0.3
        case .protein:
            return 0.35
        }
    }
    
    var kcal: Double {
        switch self {
        case .carb:
            return 4
        case .fat:
            return 9
        case .protein:
            return 4
        }
    }
    
    var multiplier: Double {
        kcalFactor()
    }
    var macrosCalculated: Double {
        macrosCalculated(calories: 0)
    }
    
    private func kcalFactor() -> Double {
       return percentage/kcal
    }
    
    private func macrosCalculated(calories: Double) -> Double {
        return calories * multiplier
    }
}
