import UIKit

class NewUserViewModel {
    
    @Published var state: NewUserViewState = .started
    
    var user: User?
}

// MARK: - Computed Properties
extension NewUserViewModel {
    //aqui acho q ta errado
    var goTogoals: Bool {
        guard let user = self.user else { return false }
        state = .filledTexts
        return true
    }
}

// MARK: - Methods
extension NewUserViewModel {
    func set(username: String) {
        if let user = self.user {
            user.name = username
        }
    }
    func set(age: Double) {
        if let user = self.user {
            user.age = age
        }
    }
    func set(height: Double) {
        if let user = self.user {
            user.height = height
        }
    }
    func set(weight: Double) {
        if let user = self.user {
            user.weight = weight
        }
    }
}

// MARK: - Service
extension NewUserViewModel {
    
}
