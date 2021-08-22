import Foundation

class User {
    let name: String = ""
    let age: Int = 0
    var weight: Double = 0.0
    var height: Int = 0
    var gender: Bool = false
    var activityLvl: String = ""
    
    func getBMI() -> Double {
        let weight = self.weight
        let height = self.height
        
        let BMI = Double(weight) / Double((height*height))
        return BMI
    }
}
