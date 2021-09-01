import Foundation
import Combine

class HomeViewModel {
    
    // MARK: - Published Properties
    @Published var state: HomeViewState = .noUser
    
    // MARK: - Stored Properties
    let user: User? = nil
}
