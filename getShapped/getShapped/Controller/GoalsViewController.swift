import UIKit

class GoalsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var goalSegmentedControl: UISegmentedControl!
    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var carbsQtyLabel: UILabel!
    @IBOutlet weak var fatQtyLabel: UILabel!
    @IBOutlet weak var proteinQtyLabel: UILabel!
    
    // MARK: - Stored Properties
    var user: User?
    var choice: Choice = .thinner
    var totalCalories: Double = 0
    
    // MARK: - Computed Properties
    lazy var macrosData: [(label: UILabel, macro: Macro)] = {
        [(carbsQtyLabel, .carb),
         (fatQtyLabel, .fat),
         (proteinQtyLabel, .protein)]
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - Setup
extension GoalsViewController {
    
    private func setLabels() {
        caloriesLabel.text = "So you have to eat \(String(format: "%.0f", totalCalories))"
        macrosData.forEach { $0.label.text = "\(String(format: "%.0f", $0.macro.getMacrosCalculated(calories: totalCalories)))" }
    }
    
    private func setUI() {
        guard let user = user,
              let choice = Choice(rawValue:goalSegmentedControl.selectedSegmentIndex) else { return }
        totalCalories = user.tdee + choice.calc
        centerImageView.image = UIImage(named: "\(choice.description)")
        setLabels()
    }
}

// MARK: - IBActions
extension GoalsViewController {
    @IBAction func setChoiceValueChanged(_ sender: UISegmentedControl) {
        setUI()
    }
}
