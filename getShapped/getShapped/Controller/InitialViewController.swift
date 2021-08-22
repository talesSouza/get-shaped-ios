import UIKit

class InitialViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBOutlet weak var newUserButton: UIButton!
    @IBOutlet weak var carbProgressView: UIProgressView!
    @IBOutlet weak var proteinProgressView: UIProgressView!
    @IBOutlet weak var fatProgressView: UIProgressView!
    
    @IBOutlet weak var totalCarbLabel: UILabel!
    @IBOutlet weak var totalProteinLabel: UILabel!
    @IBOutlet weak var totalFatLabel: UILabel!
    
    @IBOutlet weak var parcialCarbLabel: UILabel!
    @IBOutlet weak var parcialProteinLabel: UILabel!
    @IBOutlet weak var parcialFatLabel: UILabel!
    
    // MARK: - Life cycle
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let backItem = UIBarButtonItem()
//        backItem.title = ""
//        navigationItem.backBarButtonItem = backItem
//    }
    
}

// MARK: - IBActions
extension InitialViewController {
    @IBAction func newUserTouchUpInside(sender: UIButton) {
        
    }
}

