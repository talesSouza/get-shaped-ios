import UIKit

class GoalsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var goalSegmentedControl: UISegmentedControl!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var centerImage: UIImageView!
    @IBOutlet weak var carbsQtyLabel: UILabel!
    @IBOutlet weak var fatQtyLabel: UILabel!
    @IBOutlet weak var proteinQtyLabel: UILabel!
    
    // MARK: - Stored Properties
    var user: User?
    var choice: Choices?
    var totalCalories: Double?
    
    // MARK: - Computed Properties
    var labels: [UILabel] {
        [carbsQtyLabel, fatQtyLabel, proteinQtyLabel]
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - Setup
extension GoalsViewController {
    
    private func setLabel() {
        if let calories = totalCalories {
            caloriesLabel.text = "So you have to eat \(String(format: "%.0f", calories))"
        }
    }
    
    private func setMacroDistribution() {
        if let totalCalories = totalCalories {
            let carbQty = totalCalories * Macro.carb.multiplier
            let fatQty = totalCalories * Macro.fat.multiplier
            let proteinQty = totalCalories * Macro.protein.multiplier
            
            carbsQtyLabel.text = "\(String(format: "%.0f", carbQty))"
            fatQtyLabel.text = "\(String(format: "%.0f", fatQty))"
            proteinQtyLabel.text = "\(String(format: "%.0f", proteinQty))"
        }
    }
    
    private func setUI() {
        choice = Choices(rawValue: goalSegmentedControl.selectedSegmentIndex)
        if let user = user,
           let choice = choice {
            totalCalories = user.tdee + choice.calc
            centerImage.image = UIImage(named: "\(choice.name)")
            setLabel()
            setMacroDistribution()
        }
    }
}

// MARK: - IBActions
extension GoalsViewController {
    @IBAction func setChoiceValueChanged(_ sender: UISegmentedControl) {
        setUI()
    }
}
