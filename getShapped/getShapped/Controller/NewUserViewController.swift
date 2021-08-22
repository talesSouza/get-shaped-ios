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
    private func checkTextFields() -> Bool {
        for textField in textFields {
            if textField.text == nil { return false }
        }
        return true
    }
    
    private func setBMI(bmi: Double) {
        imcLabel.text = "your BMI is: \(String(format: "%.0f", bmi))"
        imcLabel.isHidden = false
    }
    
    private func checkGender() -> String {
        if genderSegmentedControl.selectedSegmentIndex == 1 {
            let tdee = newUser.getTDEE(gender: .female)
            return "Your TDEE is: \(tdee)"
        }
        let tdee = newUser.getTDEE(gender: .male)
        return "Your TDEE is: \(tdee)"
    }
    
    private func createNewUser() {
        let newUser = User()
        if let name = firstNameTextField.text,
           let age = ageTextField.text,
           let age = Double(age),
           let height = heightTextField.text,
           let height = Double(height),
           let weight = weightTextField.text,
           let weight = Double(weight) {
            newUser.name = name
            newUser.age = age
            newUser.height = height
            newUser.weight = weight
            
            tdeeLabel.text = checkGender()
        }
    }
    
    
}




// MARK: - IBActions
extension NewUserViewController {
    @IBAction func goalsTouchUpInside(_ sender: UIButton) {
    }
}

// MARK: - UITextFieldDelegate
extension NewUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if checkTextFields() {
            createNewUser()
            setBMI(bmi: newUser.getBMI())
        }
        return true
    }
}
