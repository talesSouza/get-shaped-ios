import Foundation

enum Gender: Int {
    case male = 0
    case female = 1
}

class User {
    
    // MARK: Stored Properties
    var name: String
    var age: Double
    var weight: Double
    var height: Double
    var gender: Gender
    var activityLvl: ActivityLevel
    
    // MARK: - Computed Properties
    var bmi: Double {
        getBMI()
    }
    var tmb: Double {
        getTMB()
    }
    var tdee: Double {
        getTDEE()
    }
    
    // MARK: - Initializers
    init(name: String, age: Double, weight: Double, height: Double, gender: Gender, activityLvl: ActivityLevel) {
        self.name = name
        self.age = age
        self.weight = weight
        self.height = height
        self.gender = gender
        self.activityLvl = activityLvl
    }
}

// MARKK: - Private Methods
extension User {
    private func getBMI() -> Double {
        return (weight / (height*height))*10000
    }
   
    private func getTMB() -> Double {
        switch gender {
        case .male:
            return 66 + (13.7 * weight) + (5 * height) - (6.5 * age)
        case .female:
            return (655 + (9.6 * weight) + (1.8 * height) - (4.7 * age))
        }
    }
    
    private func getTDEE() -> Double {
        return activityLvl.multiplier * tmb
    }
}
