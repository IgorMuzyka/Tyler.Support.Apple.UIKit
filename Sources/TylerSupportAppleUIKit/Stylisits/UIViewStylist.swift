
import Style
import Tag
import Variable

#if os(iOS) || os(tvOS)
import UIKit

open class UIViewStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public func style(stylable view: UIView, style: UIViewStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .isUserInteractionEnabled(let value): view.isUserInteractionEnabled = try value.resolve(pair)
        case .translatesAutoresizingMaskIntoConstraints(let value): view.translatesAutoresizingMaskIntoConstraints = try value.resolve(pair)
        case .backgroundColor(let value): view.backgroundColor = try value.resolve(pair).native
        case .tintColor(let value): view.tintColor = try value.resolve(pair).native
        case .tintAdjustmentMode(let value): view.tintAdjustmentMode = try value.resolve(pair).native!
        case .isMultipleTouchEnabled(let value): view.isMultipleTouchEnabled = try value.resolve(pair)
        case .isExclusiveTouch(let value): view.isExclusiveTouch = try value.resolve(pair)
        case .clipsToBounds(let value): view.clipsToBounds = try value.resolve(pair)
        case .alpha(let value): view.alpha = try value.resolve(pair).native
        case .isOpaque(let value): view.isOpaque = try value.resolve(pair)
        case .clearsContextBeforeDrawing(let value): view.clearsContextBeforeDrawing = try value.resolve(pair)
        case .isHidden(let value): view.isHidden = try value.resolve(pair)
        case .contentMode(let value): view.contentMode = try value.resolve(pair).native!
        }
    }
}

#endif
