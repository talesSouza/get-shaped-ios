import UIKit
import Combine

open class BaseViewController: UIViewController {
    
    // MARK: - Stored Properties
    private var cancellables: [Cancellable] = []
    
    // MARK: - Life Cycle
    deinit {
        removeObservers()
    }
}

// MARK: - Observation
extension BaseViewController {
    
    public func observe<Type>(_ publisher: Published<Type>.Publisher, action: @escaping (Type) -> Void) {
        cancellables.append(publisher.receive(on: DispatchQueue.main).sink { value in
            action(value)
        })
    }
    
    public func removeObservers() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}
