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
    @IBOutlet weak var tdeeButton: UIButton!
    @IBOutlet weak var goalsButton: UIButton!
    
    // MARK: - Stored Properties
    let activities: [String] = ActivityLevel.allCases.map { $0.rawValue }
    
    // MARK: - Computed Properties
    var textFields: [UITextField] {
        [firstNameTextField, ageTextField, heightTextField, weightTextField]
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        endEditing()
    }
}

// MARK: - Setup
extension NewUserViewController {
    private func setUI() {
        textFields.forEach{ $0.resignFirstResponder() }
        goalsButton.setupBorder()
        tdeeButton.setupBorder(borderColor: .white)
    }
    
    private func setBMI(bmi: Double) {
        imcLabel.text = "your BMI is: \(String(format: "%.0f", bmi))"
        imcLabel.isHidden = false
    }
    
    private func setTDEELabel(user: User) -> String {
        let tdee: Double
        switch genderSegmentedControl.selectedSegmentIndex {
        case 1:
            tdee = user.getTMB(gender: .female)
        default:
            tdee = user.getTMB(gender: .male)
        }
        tdeeLabel.isHidden = false
        return "Your TDEE is: \(String(format: "%.0f", tdee))"
    }
}

// MARK: - Methods
extension NewUserViewController {
    func endEditing() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func checkTextFields() -> Bool {
        for textField in textFields {
            if textField.text == nil { return false }
        }
        return true
    }
    
    private func createNewUser() {
        let newUser = User()
        if let name = firstNameTextField.text,
           let age = ageTextField.text, let age = Double(age),
           let height = heightTextField.text, let height = Double(height),
           let weight = weightTextField.text, let weight = Double(weight) {
            newUser.name = name
            newUser.age = age
            newUser.height = height
            newUser.weight = weight
            
            setBMI(bmi: newUser.getBMI())
            tdeeLabel.text = setTDEELabel(user: newUser)
        }
    }
    
    private func enableNewUser() {
        if checkTextFields() {
            createNewUser()
            goalsButton.isEnabled = false
        }
    }
}

// MARK: - IBActions
extension NewUserViewController {
    @IBAction func showTDEE(_ sender: UIButton) {
        enableNewUser()
    }
    
    @IBAction func goalsTouchUpInside(_ sender: UIButton) {
    }
    
    @IBAction func changeGenderSegmentedColor() {
        if genderSegmentedControl.selectedSegmentIndex == 1 { genderSegmentedControl.selectedSegmentTintColor = .systemPurple
        } else { genderSegmentedControl.selectedSegmentTintColor = .systemTeal}
    }
    
    @IBAction func changeActivityLevel(_ sender: UIPickerView) {
        
    }
}

// MARK: - UITextFieldDelegate
extension NewUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setUI()
        enableNewUser()
        return true
    }
}

// MARK: - UITextFieldDelegate
extension NewUserViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activities[row]
    }
}

// MARK: - UITextFieldDelegate
extension NewUserViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activities.count
    }
}
