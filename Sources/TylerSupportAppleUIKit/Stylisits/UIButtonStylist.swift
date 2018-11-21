
import Style
import Tag
import Variable

#if os(iOS) || os(tvOS)
import UIKit

open class UIButtonStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

	public func style(stylable button: UIButton, style: UIButtonStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .buttonTitle(let value, let state): button.setTitle(try value.resolve(pair), for: try state.resolve(pair).native)
        case .buttonTitleColor(let value, let state): button.setTitleColor(try value.resolve(pair).native, for: try state.resolve(pair).native)
        case .buttonTitleShadowColor(let value, let state): button.setTitleShadowColor(try value.resolve(pair).native, for: try state.resolve(pair).native)
        case .buttonImage(let value, let state): button.setImage(try value.resolve(pair).native!, for: try state.resolve(pair).native)
        case .buttonBackgroundImage(let value, let state): button.setBackgroundImage(try value.resolve(pair).native!, for: try state.resolve(pair).native)
        case .buttonAttributedTitle(let value, let state):
            if let value = try value.resolve(pair) {
				let originalTags = value.tags
				value.tags = tags
				button.setAttributedTitle(value.native, for: try state.resolve(pair).native)
				value.tags = originalTags
            }
        case .contentEdgeInsets(let value): button.contentEdgeInsets = try value.resolve(pair).native
        case .titleEdgeInsets(let value): button.titleEdgeInsets = try value.resolve(pair).native
        case .reversesTitleShadowWhenHighlighted(let value): button.reversesTitleShadowWhenHighlighted = try value.resolve(pair)
        case .imageEdgeInsets(let value): button.imageEdgeInsets = try value.resolve(pair).native
        case .adjustsImageWhenHighlighted(let value): button.adjustsImageWhenHighlighted = try value.resolve(pair)
        case .adjustsImageWhenDisabled(let value): button.adjustsImageWhenDisabled = try value.resolve(pair)
        case .showsTouchWhenHighlighted(let value): button.showsTouchWhenHighlighted = try value.resolve(pair)
        }
	}
}

#endif
