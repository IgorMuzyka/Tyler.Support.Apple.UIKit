
import Variable
import Substitutes
import Style
import Tag
import TypePreservingCodingAdapter

public enum UITextFieldStyle: Style {

    case text(Variable<String>)
    case attributedText(Variable<AttributedString>)
    case font(Variable<Font>)
    case textColor(Variable<Color>)
    case textAlignment(Variable<TextAlignment>)
    case adjustsFontSizeToFitWidth(Variable<Bool>)
    case borderStyle(Variable<TextBorderStyle>)
    case placeholder(Variable<String>)
    case attributedPlaceholder(Variable<AttributedString>)
    case clearsOnBeingEditing(Variable<Bool>)
    case clearsOnInsertion(Variable<Bool>)
    case minimumFontSize(Variable<Number>)
    case background(Variable<Image>)
    case disabledBackground(Variable<Image>)
    case allowsEditingTextAttributes(Variable<Bool>)
    case clearButtonMode(Variable<TextFieldViewMode>)
    case leftViewMode(Variable<TextFieldViewMode>)
    case rightViewMode(Variable<TextFieldViewMode>)
}

extension UITextFieldStyle {

    public static var alias: Alias = "UITextFieldStyle"
}

extension UITextFieldStyle: Codable {

    private enum CodingKeys: String, CodingKey {

        case text
        case attributedText
        case font
        case textColor
        case textAlignment
        case adjustsFontSizeToFitWidth
        case borderStyle
        case placeholder
        case attributedPlaceholder
        case clearsOnBeingEditing
        case clearsOnInsertion
        case minimumFontSize
        case background
        case disabledBackground
        case allowsEditingTextAttributes
        case clearButtonMode
        case leftViewMode
        case rightViewMode
    }

    public enum UITextFieldStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? values.decode(Variable<String>.self, forKey: .text) {
            self = .text(value)
        } else if let value = try? values.decode(Variable<AttributedString>.self, forKey: .attributedText) {
            self = .attributedText(value)
        } else if let value = try? values.decode(Variable<Font>.self, forKey: .font) {
            self = .font(value)
        } else if let value = try? values.decode(Variable<Color>.self, forKey: .textColor) {
            self = .textColor(value)
        } else if let value = try? values.decode(Variable<TextAlignment>.self, forKey: .textAlignment) {
            self = .textAlignment(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .adjustsFontSizeToFitWidth) {
            self = .adjustsFontSizeToFitWidth(value)
        } else if let value = try? values.decode(Variable<TextBorderStyle>.self, forKey: .borderStyle) {
            self = .borderStyle(value)
        } else if let value = try? values.decode(Variable<String>.self, forKey: .placeholder) {
            self = .placeholder(value)
        } else if let value = try? values.decode(Variable<AttributedString>.self, forKey: .attributedPlaceholder) {
            self = .attributedPlaceholder(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .clearsOnBeingEditing) {
            self = .clearsOnBeingEditing(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .clearsOnInsertion) {
            self = .clearsOnInsertion(value)
        } else if let value = try? values.decode(Variable<Number>.self, forKey: .minimumFontSize) {
            self = .minimumFontSize(value)
        } else if let value = try? values.decode(Variable<Image>.self, forKey: .background) {
            self = .background(value)
        } else if let value = try? values.decode(Variable<Image>.self, forKey: .disabledBackground) {
            self = .disabledBackground(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .allowsEditingTextAttributes) {
            self = .allowsEditingTextAttributes(value)
        } else if let value = try? values.decode(Variable<TextFieldViewMode>.self, forKey: .clearButtonMode) {
            self = .clearButtonMode(value)
        } else if let value = try? values.decode(Variable<TextFieldViewMode>.self, forKey: .leftViewMode) {
            self = .leftViewMode(value)
        } else if let value = try? values.decode(Variable<TextFieldViewMode>.self, forKey: .rightViewMode) {
            self = .rightViewMode(value)
        } else {
            throw UITextFieldStyleCodingError.decoding("\(dump(values))")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .text(let value): try container.encode(value, forKey: .text)
        case .attributedText(let value): try container.encode(value, forKey: .attributedText)
        case .font(let value): try container.encode(value, forKey: .font)
        case .textColor(let value): try container.encode(value, forKey: .textColor)
        case .textAlignment(let value): try container.encode(value, forKey: .textAlignment)
        case .adjustsFontSizeToFitWidth(let value): try container.encode(value, forKey: .adjustsFontSizeToFitWidth)
        case .borderStyle(let value): try container.encode(value, forKey: .borderStyle)
        case .placeholder(let value): try container.encode(value, forKey: .placeholder)
        case .attributedPlaceholder(let value): try container.encode(value, forKey: .attributedPlaceholder)
        case .clearsOnBeingEditing(let value): try container.encode(value, forKey: .clearsOnBeingEditing)
        case .clearsOnInsertion(let value): try container.encode(value, forKey: .clearsOnInsertion)
        case .minimumFontSize(let value): try container.encode(value, forKey: .minimumFontSize)
        case .background(let value): try container.encode(value, forKey: .background)
        case .disabledBackground(let value): try container.encode(value, forKey: .disabledBackground)
        case .allowsEditingTextAttributes(let value): try container.encode(value, forKey: .allowsEditingTextAttributes)
        case .clearButtonMode(let value): try container.encode(value, forKey: .clearButtonMode)
        case .leftViewMode(let value): try container.encode(value, forKey: .leftViewMode)
        case .rightViewMode(let value): try container.encode(value, forKey: .rightViewMode)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: UITextFieldStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
