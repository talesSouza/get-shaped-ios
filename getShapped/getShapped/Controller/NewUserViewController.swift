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
    
    private func setBMILabel() {
        guard let user = user else { return }
        imcLabel.text = "your BMI is: \(String(format: "%.0f", user.bmi))"
        imcLabel.isHidden = false
    }
    
    private func setTDEELabel() {
        guard let user = user else { return }
        tdeeLabel.text = "Your TDEE is: \(String(format: "%.0f", user.tdee))"
    }
}

// MARK: - Methods
extension NewUserViewController {
    
    func endEditing() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func createNewUser() {
        guard let name = firstNameTextField.text,
              let ageText = ageTextField.text, let age = Double(ageText),
              let heightText = heightTextField.text, let height = Double(heightText),
              let weightText = weightTextField.text, let weight = Double(weightText),
              let gender = Gender(rawValue: genderSegmentedControl.selectedSegmentIndex),
              let activityLvl = selectedActivity else { return }
        
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

// MARK: - IBActions
extension NewUserViewController {
    
    @IBAction private func createNewUserTouchUpInside(_ sender: UIButton) {
        createNewUser()
    }
    
    @IBAction func showTDEE(_ sender: UIButton) {
        enableNewUser()
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
        setUI()
        enableNewUser()
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
        enableNewUser()
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
