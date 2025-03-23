import UIKit

extension UIView {
    static func createMultiplePetsBackground(with image: UIImage?) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .clear

        for index in 0..<5 {
            let petImageView = UIImageView(image: image)
            petImageView.tintColor = .white.withAlphaComponent(.alpha)
            petImageView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(petImageView)

            NSLayoutConstraint.activate([
                petImageView.widthAnchor.constraint(equalToConstant: .sizeConstraint),
                petImageView.heightAnchor.constraint(equalToConstant: .sizeConstraint),
                petImageView.leadingAnchor.constraint(
                    equalTo: containerView.leadingAnchor,
                    constant: .leadingAnchor(for: index)
                ),
                petImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .topAnchor(for: index))
            ])
        }

        return containerView
    }
}

private extension CGFloat {
    static let sizeConstraint: Self = 24
    static let alpha: Self = 0.2
    static func leadingAnchor(for viewIndex: Int) -> Self {
        CGFloat(viewIndex * 20)
    }
    static func topAnchor(for viewIndex: Int) -> Self {
        CGFloat(viewIndex % 2 * 15)
    }
}
