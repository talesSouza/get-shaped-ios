import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var newUserButton: ButtonView!
    
//    @IBOutlet weak var carbProgressView: UIProgressView!
//    @IBOutlet weak var proteinProgressView: UIProgressView!
//    @IBOutlet weak var fatProgressView: UIProgressView!
//    @IBOutlet weak var usernameLabel: UILabel!
//    @IBOutlet weak var totalCarbLabel: UILabel!
//    @IBOutlet weak var totalProteinLabel: UILabel!
//    @IBOutlet weak var totalFatLabel: UILabel!
//    @IBOutlet weak var partialCarbLabel: UILabel!
//    @IBOutlet weak var partialProteinLabel: UILabel!
//    @IBOutlet weak var partialFatLabel: UILabel!
    
    // MARK: - Stored Properties
//    var user: User?
    let viewModel: HomeViewModel = HomeViewModel()
    
}

// MARK: - Life Cycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
//        setUserInfos()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - Setup
extension HomeViewController {
    func setupButtons() {
        newUserButton.set(title: "home.newuser".localized, style: .secondary)
        newUserButton.set { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "goToNewUser", sender: .none)
        }
        newUserButton.setupBorder(borderColor: .white)
    }
}

// MARK: - View State
extension HomeViewController {
    private func changed(state: HomeViewState) {
        switch state {
        case .noUser:
            //iniciar direto a tela de newUser
            break
        case .userCreated:
            //iniciar nesta tela
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

