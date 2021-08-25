import UIKit

class GoalsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var goalSegmentedControl: UISegmentedControl!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var centerImage: UIImageView!
    @IBOutlet weak var carbsQtyLabel: UILabel!
    @IBOutlet weak var fatQtyLabel: UILabel!
    @IBOutlet weak var proteinQtyLabel: UILabel!
    
    var user: User?
    var choice: Choices?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - Private Methods
extension GoalsViewController {
    
    private func setUI() {
        choice = Choices(rawValue: goalSegmentedControl.selectedSegmentIndex)
        if let user = user,
           let choice = choice {
            let calories = user.tdee + choice.calc
            centerImage.image = UIImage(named: "\(choice.name)")
            caloriesLabel.text = "So you have to eat \(String(format: "%.0f", calories))"
        }
    }
}

// MARK: - IBActions
extension GoalsViewController {
    @IBAction func setChoiceValueChanged(_ sender: UISegmentedControl) {
        setUI()
    }
}
