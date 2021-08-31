import UIKit

class NewUserViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var goalsButton: UIButton!
    
    @IBOutlet weak var imcLabel: UILabel!
    @IBOutlet weak var tdeeLabel: UILabel!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var activityLevelPickerView: UIPickerView!
    
    // MARK: - Stored Properties
    let activities: [ActivityLevel] = ActivityLevel.allCases
    var selectedActivity: ActivityLevel? = .highLevel
    var user: User?
    
    // MARK: - Computed Properties
    var textFields: [UITextField] {
        [firstNameTextField, ageTextField, heightTextField, weightTextField]
    }
}

// MARK: - Life Cycle
extension NewUserViewController {
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
        goalsButton.setupBorder(borderColor: .white)
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
            infoButton.isHidden = false
        }
    }
    
    func endEditing() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

// MARK: - Methods
extension NewUserViewController {
    
    @discardableResult
    private func createNewUser() -> Bool {
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
            return true
        }
        return false
    }
}

// MARK: - IBActions
extension NewUserViewController {
    
    @IBAction func changeGenderSegmentedColor() {
        genderSegmentedControl.selectedSegmentTintColor = genderSegmentedControl.selectedSegmentIndex == 0 ? .systemTeal : .systemPurple
        createNewUser()
    }
    
    @IBAction func presentInfoTouchUpInside(_ sender: UIButton) {
        let alert = UIAlertController(title: "TDEE",
                                      message: "is an estimation of how many calories you burn per day when exercise is taken into account.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func goalsTouchUpInside(_ sender: UIButton) {
        if createNewUser() {
            performSegue(withIdentifier: "goToGoals", sender: nil)
        }
    }
}

// MARK: - UITextFieldDelegate
extension NewUserViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setTextField()
        createNewUser()
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
        createNewUser()
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
