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
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        newUserButton.setupBorder(borderColor: .white)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - IBActions
extension InitialViewController {
    @IBAction func newUserTouchUpInside(sender: UIButton) {
    }
}

