import UIKit

public final class KittyButton: UIButton, PrettyButton {

    public var action: () -> Void
    public var level: PrettyLevel {
        didSet {
            updateAppearance()
        }
    }

    private var baseConfig: UIButton.Configuration {
        var config = UIButton.Configuration.filled()

        config.title = titleLabel?.text
        config.cornerStyle = .large
        return config
    }

    public init(
        title: String,
        level: PrettyLevel,
        action: @escaping () -> Void
    ) {
        self.action = action
        self.level = level
        super.init(frame: .zero)

        setTitle(title, for: .normal)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        updateAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func buttonTapped() {
        action()
    }

    private func updateAppearance() {
        switch level {
        case .default:
            configureCatButton()
        case .extraPretty:
            extraPrettyCatButton()
        }
    }

    private func configureCatButton() {
        var config = baseConfig
        let image = UIImage.cat?.withTintColor(.white.withAlphaComponent(0.6), renderingMode: .alwaysOriginal)

        config.background.backgroundColor = .systemBlue
        config.image = image
        config.imagePlacement = .trailing
        config.imagePadding = .defaultButtonPadding

        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .defaultButtonFont
            return outgoing
        }

        config.buttonSize = .medium
        configuration = config
    }

    private func extraPrettyCatButton() {
        var config = baseConfig
        let image = UIImage.cat?.withTintColor(.white, renderingMode: .alwaysOriginal)

        config.background.backgroundColor = .systemPink
        config.image = image
        config.imagePlacement = .trailing
        config.imagePadding = .extraPrettyButtonPadding

        let catBackgroundImage = UIView.createMultiplePetsBackground(with: .catFilled)
        config.background.customView = catBackgroundImage

        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .extraPrettyButtonFont
            return outgoing
        }

        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .large)
        config.buttonSize = .large

        config.subtitle = .subtitle
        config.titlePadding = .titlePadding
        configuration = config
    }

}

private extension UIImage {
    static var cat: UIImage? {
        UIImage(systemName: "cat")
    }
    static var catFilled: UIImage? {
        UIImage(systemName: "cat.fill")
    }
}

private extension CGFloat {
    static let titlePadding: Self = 8
    static let defaultButtonPadding: Self = 6
    static let extraPrettyButtonPadding: Self = 10
}

private extension UIFont {
    static var defaultButtonFont: UIFont {
        UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    static var extraPrettyButtonFont: UIFont {
        UIFont.boldSystemFont(ofSize: 18)
    }
}

private extension String {
    static let subtitle: String = "Meow!"
}
