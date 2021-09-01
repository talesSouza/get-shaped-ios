import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - Dependencies
    let viewModel: HomeViewModel = HomeViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var newUserButton: ButtonView!
    
    @IBOutlet weak var carbProgressView: UIProgressView!
    @IBOutlet weak var proteinProgressView: UIProgressView!
    @IBOutlet weak var fatProgressView: UIProgressView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var totalCarbLabel: UILabel!
    @IBOutlet weak var totalProteinLabel: UILabel!
    @IBOutlet weak var totalFatLabel: UILabel!
    @IBOutlet weak var partialCarbLabel: UILabel!
    @IBOutlet weak var partialProteinLabel: UILabel!
    @IBOutlet weak var partialFatLabel: UILabel!
    
}

// MARK: - Life Cycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - Setup
extension HomeViewController {
    func setupButtons() {
        newUserButton.set(title: "home.newuser".localized, style: .secondary)
        newUserButton.setupBorder(borderColor: .white)
        newUserButton.set { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "goToNewUser", sender: .none)
        }
    }
}

// MARK: - View State
extension HomeViewController {
    private func changed(state: HomeViewState) {
        switch state {
        case .noUser:
            print("deve começar na proxima tela")
            break
        case .userCreated:
            print("deve iniciar nesta tela")
            break
        }
    }
    
    private func setObserver() {
        observe(viewModel.$state) { [weak self] state in
            guard let self = self else { return }
            self.changed(state: state)
        }
    }
    
    
    //PAREI AQUI
}

