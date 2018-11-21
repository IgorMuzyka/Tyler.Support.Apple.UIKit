
import Style
import Tag
import Variable

#if os(iOS) || os(tvOS)
import UIKit

open class UIControlStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

	public func style(stylable control: UIControl, style: UIControlStyle, tags: [Tag], pair: VariableResolutionPair) throws {
		switch style {
		case .isEnabled(let value): control.isEnabled = try value.resolve(pair)
		case .isSelected(let value): control.isSelected = try value.resolve(pair)
		case .isHighlighted(let value): control.isHighlighted = try value.resolve(pair)
		}
	}
}

#endif
