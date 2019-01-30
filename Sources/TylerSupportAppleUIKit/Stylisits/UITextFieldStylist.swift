
import Style
import Tag
import Variable

#if os(iOS) || os(tvOS)
import UIKit

open class UITextFieldStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public required init() {}

    public func style(stylable textField: UITextField, style: UITextFieldStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .text(let value): textField.text = try value.resolve(pair)
        case .attributedText(let value):
            if let value = try value.resolve(pair) {
                let originalTags = value.tags
                value.tags = tags
                textField.attributedText = value.native
                value.tags = originalTags
            }
        case .font(let value): textField.font = try value.resolve(pair)?.native
        case .textColor(let value): textField.textColor = try value.resolve(pair)?.native
        case .textAlignment(let value): textField.textAlignment = try value.resolve(pair).native!
        case .adjustsFontSizeToFitWidth(let value): textField.adjustsFontSizeToFitWidth = try value.resolve(pair)!
        case .borderStyle(let value): textField.borderStyle = try value.resolve(pair).native!
        case .placeholder(let value): textField.placeholder = try value.resolve(pair)
        case .attributedPlaceholder(let value): textField.attributedPlaceholder = try value.resolve(pair).native
        case .clearsOnBeingEditing(let value): textField.clearsOnBeginEditing = try value.resolve(pair)
        case .clearsOnInsertion(let value): textField.clearsOnInsertion = try value.resolve(pair)
        case .minimumFontSize(let value): textField.minimumFontSize = try value.resolve(pair).native
        case .background(let value): textField.background = try value.resolve(pair).native
        case .disabledBackground(let value): textField.disabledBackground = try value.resolve(pair).native
        case .allowsEditingTextAttributes(let value): textField.allowsEditingTextAttributes = try value.resolve(pair)
        case .clearButtonMode(let value): textField.clearButtonMode = try value.resolve(pair).native!
        case .leftViewMode(let value): textField.leftViewMode = try value.resolve(pair).native!
        case .rightViewMode(let value): textField.rightViewMode = try value.resolve(pair).native!
        }
    }
}

#endif
