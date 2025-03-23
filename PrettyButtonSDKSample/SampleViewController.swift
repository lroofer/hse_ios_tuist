import UIKit
import KittyButtonSDK

class SampleViewController: UIViewController {

    private lazy var kittyButton: PrettyButton = {
        KittyButton(title: .kittyButtonTitle, level: .default) {
            print("Pressed kitty button")
        }
    }()

    private lazy var extraPrettyKittyButton: PrettyButton = {
        KittyButton(title: .kittyButtonTitle, level: .extraPretty) {
            print("Pressed extra pretty kitty button")
        }
    }()

    private let stack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = .viewControllerTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        configureStack()
    }

    private func configureStack() {
        stack.axis = .vertical
        stack.spacing = .stackSpacing
        view.addSubview(stack)

        for subview in [
            kittyButton,
            extraPrettyKittyButton
        ] {
            stack.addArrangedSubview(subview)
        }

        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .stackTop),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: .stackLeading),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: .stackTrailing),
            kittyButton.heightAnchor.constraint(equalToConstant: .defaultButtonHeight),
            extraPrettyKittyButton.heightAnchor.constraint(equalToConstant: .defaultButtonHeight)
        ])
    }

}

private extension CGFloat {
    static let stackTop: Self = 20
    static let stackLeading: Self = 20
    static let stackTrailing: Self = -20
    static let stackSpacing: Self = 20

    static let defaultButtonHeight: Self = 50
}

private extension String {
    static let viewControllerTitle: Self = "Pretty Button Samples"
    static let kittyButtonTitle: Self = "Kitty button"
}
