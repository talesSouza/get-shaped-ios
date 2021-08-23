import Foundation

enum Gender {
    case male
    case female
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
    
    func getTDEE(activityLvl: ActivityLevel.RawValue, tmb: Double) -> Double {
        switch activityLvl {
        case "High level":
            return 1.9*tmb
        case "Athletic":
            return 1.725*tmb
        case "Moderate":
            return 1.55*tmb
        case "Smooth":
            return 1.375*tmb
        case "Sedentary":
            return 1.2*tmb
        default:
            return 0
        }
    }
}
