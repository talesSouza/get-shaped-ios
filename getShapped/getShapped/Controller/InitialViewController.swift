import UIKit

class InitialViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var newUserButton: UIButton!
    
    @IBOutlet weak var carbProgressView: UIProgressView!
    @IBOutlet weak var proteinProgressView: UIProgressView!
    @IBOutlet weak var fatProgressView: UIProgressView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var totalCarbLabel: UILabel!
    @IBOutlet weak var totalProteinLabel: UILabel!
    @IBOutlet weak var totalFatLabel: UILabel!
    @IBOutlet weak var partialCarbLabel: UILabel!
    @IBOutlet weak var partialProteinLabel: UILabel!
    @IBOutlet weak var partialFatLabel: UILabel!
    
    // MARK: - Stored Properties
    var user: User?
}

// MARK: - Life Cycle
extension InitialViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        setUserInfos()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - Setup
extension InitialViewController {
    func setLayout() {
        newUserButton.setupBorder(borderColor: .white)
    }
}

// MARK: - Private Methods
extension InitialViewController {
    private func setUserInfos() {
        guard let user = user else { return }
        usernameLabel.text = user.name
        usernameLabel.isHidden = false
    }
}

// MARK: - IBActions
extension InitialViewController {
    @IBAction func newUserTouchUpInside(sender: UIButton) {
    }
}

