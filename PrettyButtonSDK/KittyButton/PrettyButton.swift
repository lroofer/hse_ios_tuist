import UIKit

public protocol PrettyButton: UIButton {
    var action: () -> Void { get set }
    var level: PrettyLevel { get set }
}

public enum PrettyLevel {
    case `default`
    case extraPretty
}
