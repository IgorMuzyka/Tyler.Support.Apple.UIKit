
import Style
import Tag
import Variable

#if os(iOS) || os(tvOS)
import UIKit

open class UILabelStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public required init() {}

	public func style(stylable label: UILabel, style: UILabelStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .font(let value): label.font = try value.resolve(pair).native
        case .textColor(let value): label.textColor = try value.resolve(pair).native
        case .textAlignment(let value): label.textAlignment = try value.resolve(pair).native!
        case .numberOfLines(let value): label.numberOfLines = try value.resolve(pair)
        case .lineBreakMode(let value): label.lineBreakMode = try value.resolve(pair).native!
        case .minimumScaleFactor(let value): label.minimumScaleFactor = try value.resolve(pair).native
        case .adjustsFontSizeToFitWidth(let value): label.adjustsFontSizeToFitWidth = try value.resolve(pair)
        case .baselineAdjustment(let value): label.baselineAdjustment = try value.resolve(pair).native!
        case .shadowColor(let value): label.shadowColor = try value.resolve(pair).native
        case .shadowOffset(let value): label.shadowOffset = try value.resolve(pair).native
        case .highlightedTextColor(let value): label.highlightedTextColor = try value.resolve(pair).native
        case .attributedText(let value):
            if let value = try value.resolve(pair) {
				let originalTags = value.tags
                value.tags = tags
                label.attributedText = value.native
				value.tags = originalTags
            }
        case .text(let value): label.text = try value.resolve(pair)
        }
    }
}

#endif
