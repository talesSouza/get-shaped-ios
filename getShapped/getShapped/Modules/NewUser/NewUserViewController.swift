import UIKit

class NewUserViewController: BaseViewController {
    
    // MARK: - Dependencies
    let viewModel: NewUserViewModel = NewUserViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var goalsButton: ButtonView!
    
    @IBOutlet weak var imcLabel: UILabel!
    @IBOutlet weak var tdeeLabel: UILabel!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var activityLevelPickerView: UIPickerView!
    
    // MARK: - Stored Properties
    let activities: [ActivityLevel] = ActivityLevel.allCases
    var selectedActivity: ActivityLevel? = .highLevel
    
    // MARK: - Computed Properties
    var textFields: [UITextField] {
        [usernameTextField, ageTextField, heightTextField, weightTextField]
    }
}

// MARK: - Life Cycle
extension NewUserViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
}

// MARK: - Navigation
extension NewUserViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GoalsViewController,
           let user = viewModel.user {
            vc.user = user
        }
    }
}

// MARK: - Setup
extension NewUserViewController {
    
    private func setTextField() {
        textFields.forEach{ $0.resignFirstResponder() }
    }
    
    private func setupButton() {
        goalsButton.set(title: "newuser.goals".localized, style: .primary)
        goalsButton.setupBorder(borderColor: .white)
    }
    
    //COMPONETIZAR AS LABELS
    
    private func setBMILabel() {
        if let user = viewModel.user {
            imcLabel.text = "your BMI is: \(String(format: "%.0f", user.bmi))"
            imcLabel.isHidden = false
        }
    }
    
    private func setTDEELabel() {
        if let user = viewModel.user {
            tdeeLabel.text = "Your TDEE is: \(String(format: "%.0f", user.tdee))"
            
            tdeeLabel.isHidden = false
            infoButton.isHidden = false
        }
    }
}

// MARK: - View State
extension NewUserViewController {
    
    private func changed(state: NewUserViewState) {
        switch state {
        case .started:
            break
        case .filledTexts:
            setBMILabel()
            setTDEELabel()
        }
    }
    
    private func setObserver() {
        observe(viewModel.$state) { [weak self] state in
            guard let self = self else { return }
            self.changed(state: state)
        }
    }
}
    
// MARK: - Methods
extension NewUserViewController {
    func goToGoals() {
        //aqui tbm acho q ta errado
        if viewModel.goTogoals {
            goalsButton.set { [weak self] in
                guard let self = self else { return }
                self.performSegue(withIdentifier: "goToGoals", sender: .none)
            }
        }
    }
    
    @discardableResult
    private func createNewUser() -> Bool {
        if let name = usernameTextField.text,
           let ageText = ageTextField.text, let age = Double(ageText),
           let heightText = heightTextField.text, let height = Double(heightText),
           let weightText = weightTextField.text, let weight = Double(weightText),
           let gender = Gender(rawValue: genderSegmentedControl.selectedSegmentIndex),
           let activityLvl = selectedActivity {
            
            viewModel.user = User(name: name,
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
}

// MARK: - UITextFieldDelegate
extension NewUserViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        switch text {
        case usernameTextField.text:
            viewModel.set(username: text)
        case ageTextField.text:
            if let age = Double(text) {
                viewModel.set(age: age)
            }
        case heightTextField.text:
            if let height = Double(text) {
                viewModel.set(height: height)
            }
        case weightTextField.text:
            if let weight = Double(text) {
                viewModel.set(weight: weight)
            }
        default:
            print("error")
        }
    }
}
// PERGUNTAR QUAL MELHOR OPÇAO
//
//        if text == usernameTextField.text {
//            viewModel.set(username: text)
//        } else if text == ageTextField.text {
//            if let age = Int(text) {
//            viewModel.set(age: age)
//            }
//        } else if text == heightTextField.text {
//            if let height = Int(text) {
//                viewModel.set(height: height)
//            }
//        } else if text == weightTextField.text {
//            if let weight = Int(text) {
//                viewModel.set(weight: weight)
//            }
//        }
//    }
//}

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
