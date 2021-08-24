import UIKit

class GoalsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var goalSegmentedControl: UISegmentedControl!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var carbsQtyLabel: UILabel!
    @IBOutlet weak var fatQtyLabel: UILabel!
    @IBOutlet weak var proteinQtyLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
