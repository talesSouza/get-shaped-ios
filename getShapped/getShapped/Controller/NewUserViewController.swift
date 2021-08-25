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
    let activities: [ActivityLevel] = ActivityLevel.allCases
    var selectedActivity: ActivityLevel?
    var user: User?
    
    // MARK: - Computed Properties
    var textFields: [UITextField] {
        [firstNameTextField, ageTextField, heightTextField, weightTextField]
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        endEditing()
    }
}

// MARK: - Navigation
extension NewUserViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GoalsViewController,
           let user = user {
            vc.user = user
        }
    }
}

// MARK: - Setup
extension NewUserViewController {
    
    private func setTextField() {
        textFields.forEach{ $0.resignFirstResponder() }
    }
    
    private func setButton() {
        goalsButton.setupBorder()
        tdeeButton.setupBorder(borderColor: .white)
    }
    
    private func setBMILabel() {
        if let user = user {
            imcLabel.text = "your BMI is: \(String(format: "%.0f", user.bmi))"
            imcLabel.isHidden = false
        }
    }
    
    private func setTDEELabel() {
        if let user = user {
            tdeeLabel.text = "Your TDEE is: \(String(format: "%.0f", user.tdee))"
            tdeeLabel.isHidden = false
        }
    }
    
    func endEditing() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

// MARK: - Methods
extension NewUserViewController {
    
    private func createNewUser() {
        if let name = firstNameTextField.text,
           let ageText = ageTextField.text, let age = Double(ageText),
           let heightText = heightTextField.text, let height = Double(heightText),
           let weightText = weightTextField.text, let weight = Double(weightText),
           let gender = Gender(rawValue: genderSegmentedControl.selectedSegmentIndex),
           let activityLvl = selectedActivity {
            
            user = User(name: name,
                        age: age,
                        weight: weight,
                        height: height,
                        gender: gender,
                        activityLvl: activityLvl)
            setBMILabel()
            setTDEELabel()
            goalsButton.isEnabled = false
        }
    }
}

// MARK: - IBActions
extension NewUserViewController {
    
    @IBAction private func createNewUserTouchUpInside(_ sender: UIButton) {
        createNewUser()
        goalsButton.isEnabled = true
    }
    
    @IBAction func goalsTouchUpInside(_ sender: UIButton) {
    }
    
    @IBAction func changeGenderSegmentedColor() {
        genderSegmentedControl.selectedSegmentTintColor = genderSegmentedControl.selectedSegmentIndex == 0 ? .systemTeal : .systemPurple
    }
}

// MARK: - UITextFieldDelegate
extension NewUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setTextField()
        return true
    }
}

// MARK: - UIPickerViewDelegate
extension NewUserViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activities[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedActivity = activities[row]
    }
}

// MARK: - UIPickerViewDataSource
extension NewUserViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activities.count
    }
}
