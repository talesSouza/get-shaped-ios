import Foundation

enum Macro: Double {
    case carb
    case fat
    case protein
    
    // MARK: - Computed Properties
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
    
    var kcalMultiplier: Double {
        kcalFactor()
    }
    
    // MARK: - Private Methods
    private func kcalFactor() -> Double {
       return percentage/kcal
    }
    
    // MARK: - Public Methods
    func getMacrosCalculated(calories: Double) -> Double {
        return calories * kcalMultiplier
    }
}
