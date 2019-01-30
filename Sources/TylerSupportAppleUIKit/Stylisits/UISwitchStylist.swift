
import Style
import Tag
import Variable

#if os(iOS) || os(tvOS)
import UIKit

open class UISwitchStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public required init() {}

    public func style(stylable switch: UISwitch, style: UISwitchStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .onTintColor(let value): `switch`.onTintColor = try value.resolve(pair).native
        case .thumbTintColor(let value): `switch`.thumbTintColor = try value.resolve(pair).native
        case .onImage(let value): `switch`.onImage = try value.resolve(pair).native
        case .offImage(let value): `switch`.offImage = try value.resolve(pair).native
        case .isOn(let value): `switch`.isOn = try value.resolve(pair)
        }
    }
}

#endif
