import Foundation

enum Gender {
    case male
    case female
}

enum ActivityLevel: String, CaseIterable {
    case highLevel = "High level"
    case athletic = "Athletic"
    case moderate = "Moderate"
    case smooth = "Smooth"
    case sedentary = "Sedentary"
}

class User {
    var name: String = ""
    var age: Double = 0
    var weight: Double = 0
    var height: Double = 0
    var gender: Gender = .male
    var activityLvl: String = ""
    
    func getBMI() -> Double {
        let weight = weight
        let height = height
        
        let BMI = (Double(weight) / Double((height*height)))*10000
        return BMI
    }
    
    func getTMB(gender: Gender) -> Double {
        switch gender {
        case .male:
            let maleCalc = 66 + (13.7 * weight) + (5 * height) - (6.5 * age)
            return maleCalc
        case .female:
            let femaleCalc = (655 + (9.6 * weight) + (1.8 * height) - (4.7 * age))
            return femaleCalc
        }
    }
    
    func getTDEE(activityLvl: ActivityLevel, tmb: Double) -> Double {
        switch activityLvl {
        case .highLevel:
            return 1.9*tmb
        case .athletic:
            return 1.725*tmb
        case .moderate:
            return 1.55*tmb
        case .smooth:
            return 1.375*tmb
        case .sedentary:
            return 1.9*tmb
        }
    }
}
