import UIKit

class GoalsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var goalSegmentedControl: UISegmentedControl!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var carbsQtyLabel: UILabel!
    @IBOutlet weak var fatQtyLabel: UILabel!
    @IBOutlet weak var proteinQtyLabel: UILabel!
    
    var user: User?
    var calories: Double?
    var choice: Choices?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - Private Methods
extension GoalsViewController {
    func getCalories() {
        choice = Choices(rawValue: goalSegmentedControl.selectedSegmentIndex)
        if let user = user,
           let choice = choice {
            switch choice {
            case .thinner:
                calories = user.tdee + choice.calc
            case .preserve:
                calories = user.tdee + choice.calc
            case .stronger:
                calories = user.tdee + choice.calc
            }
        }
    }
    
    func setLabel() {
        caloriesLabel.isHidden = false
        if let calories = calories {
            caloriesLabel.text = "So you have to eat \(String(format: "%.0f", calories))"
        }
    }
}

// MARK: - IBActions
extension GoalsViewController {
    @IBAction func setChoiceValueChanged(_ sender: UISegmentedControl) {
        getCalories()
        setLabel()
    }
}
