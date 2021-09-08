import UIKit

class ButtonView: UIView, NibOwnerLoadable {
    
    @IBOutlet private var button: UIButton!
    
    // MARK: - Stored Properties
    private let textBuilder = TextBuilder()
    
    // MARK: - Actions
    private var onTapAction: SimpleClosure = {}
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadNibContent()
    }
}

// MARK: - Public Methods
extension ButtonView {
    func set(title: String, style: ButtonViewStyle) {
        button.setAttributedTitle(textBuilder.buildText(text: title, style: style.textStyle), for: .normal)
        button.backgroundColor = style.background
    }
    
    func set(onTapAction: @escaping SimpleClosure) {
        self.onTapAction = onTapAction
    }
}

// MARK: - IBActions
extension ButtonView {
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        onTapAction()
    }
}
