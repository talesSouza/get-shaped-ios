import UIKit

class NewUserViewModel {
    
    @Published var state: NewUserViewState = .started
    
    private var user: User?
    
    private var username: String?
    private var age: Int?
    private var height: Int?
    private var weight: Int?
}

// MARK: - Computed Properties
extension NewUserViewModel {
    var goTogoals: Bool {
        goToGoals()
    }
}

extension NewUserViewModel {
    func set(username: String) {
        self.username = username
    }
    func set(age: Int) {
        self.age = age
    }
    func set(height: Int) {
        self.height = height
    }
    func set(weight: Int) {
        self.weight = weight
    }
}

// MARK: - Service
extension NewUserViewModel {

    func goToGoals() -> Bool {
        guard let username = username,
              let age = age,
              let height = height,
              let weight = weight else { return false }
        state = .filledTexts
        return true
    }
}
