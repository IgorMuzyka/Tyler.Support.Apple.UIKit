
import Style
import Tag
import Variable

#if os(iOS) || os(tvOS)
import UIKit

open class UITextViewStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public required init() {}

    public func style(stylable textView: UITextView, style: UITextViewStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .text(let value): textView.text = try value.resolve(pair)
        case .font(let value): textView.font = try value.resolve(pair).native
        case .textColor(let value): textView.textColor = try value.resolve(pair).native
        case .textAlignment(let value): textView.textAlignment = try value.resolve(pair).native!
        case .editable(let value): textView.isEditable = try value.resolve(pair)
        case .dataDetectorTypes(let value): textView.dataDetectorTypes = try value.resolve(pair).native
        case .attributedText(let value):
            if let value = try value.resolve(pair) {
                let originalTags = value.tags
                value.tags = tags
                textView.attributedText = value.native
                value.tags = originalTags
            }

        case .clearsOnInsertion(let value): textView.clearsOnInsertion = try value.resolve(pair)
        }
    }
}

#endif
