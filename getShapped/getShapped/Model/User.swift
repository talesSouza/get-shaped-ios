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
        let weight = self.weight
        let height = self.height
        
        let BMI = (Double(weight) / Double((height*height)))*10000
        return BMI
    }
    
    func getTDEE(gender: Gender) -> Double {
        switch gender {
        case .male:
            let maleCalc = 66 + (13.7 * weight) + (5 * height) - (6.5 * age)
            return maleCalc
        case .female:
            let femaleCalc = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age)
            return femaleCalc
        default:
            return 0
        }
    }
}
