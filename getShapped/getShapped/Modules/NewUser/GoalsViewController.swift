import UIKit

class GoalsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var goalSegmentedControl: UISegmentedControl!
    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var carbsQtyLabel: UILabel!
    @IBOutlet weak var fatQtyLabel: UILabel!
    @IBOutlet weak var proteinQtyLabel: UILabel!
    @IBOutlet weak var createButton: UIButton!
    
    // MARK: - Stored Properties
    var user: User?
    var choice: Choice = .thinner
    var totalCalories: Double = 0
    var macroCalculated: Macro?
    
    // MARK: - Computed Properties
    lazy var macrosData: [(label: UILabel, macro: Macro)] = {
        [(carbsQtyLabel, .carb),
         (fatQtyLabel, .fat),
         (proteinQtyLabel, .protein)]
    }()
}

// MARK: - Life Cycle
extension GoalsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setViewsLayout()
    }
}

// MARK: - Setup
extension GoalsViewController {
    
    private func setViewsLayout() {
        createButton.setupBorder(borderColor: .white)
        macrosData.forEach { $0.label.setupBorder(borderColor: .white) }
    }
    
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

// MARK: - Private Methods
extension GoalsViewController {
    
    private func setMacroData() {
        
    }
}

// MARK: - IBActions
extension GoalsViewController {
    
    @IBAction func setChoiceValueChanged(_ sender: UISegmentedControl) {
        setUI()
    }
    
    @IBAction func userGotCreated(_ sender: UIButton) {
        
        
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
