import UIKit

class NewUserViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var imcLabel: UILabel!
    @IBOutlet weak var activityLevelPickerView: UIPickerView!
    @IBOutlet weak var tdeeLabel: UILabel!
    @IBOutlet weak var goalsButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        goalsButton.setupBorder()
    }
}

// MARK: - IBActions
extension NewUserViewController {
    @IBAction func goalsTouchUpInside(sender: UIButton) {
        
    }
}
