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
    
    // MARK: - Stored Properties
    let newUser = User()
    
    // MARK: - Computed Properties
    var textFields: [UITextField] {
        [firstNameTextField, ageTextField, heightTextField, weightTextField]
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - Setup
extension NewUserViewController {
    private func setUI() {
        textFields.forEach{ $0.resignFirstResponder() }
        goalsButton.setupBorder()
    }
}

// MARK: - Methods
extension NewUserViewController {
    private func setBMI(bmi: Double) {
        imcLabel.text = "your BMI is: \(bmi)"
    }
    
    private func checkTextFields() -> Bool {
        for textField in textFields {
            if textField.text == nil { return false }
        }
        return true
    }
}

// MARK: - IBActions
extension NewUserViewController {
    @IBAction func goalsTouchUpInside(sender: UIButton) {
    }
}

// MARK: - UITextFieldDelegate
extension NewUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if checkTextFields() {
            let newUser = User()
        }
        return true
    }
}
