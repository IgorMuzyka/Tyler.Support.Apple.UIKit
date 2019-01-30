
import Variable
import Substitutes
import Style
import Tag
import TypePreservingCodingAdapter

public enum UITextViewStyle: Style {

    case text(Variable<String>)
    case font(Variable<Font>)
    case textColor(Variable<Color>)
    case textAlignment(Variable<TextAlignment>)
//    case selectedRange
    case editable(Variable<Bool>)
    case dataDetectorTypes(Variable<DataDetectorTypes>)
    case attributedText(Variable<AttributedString>)
    case clearsOnInsertion(Variable<Bool>)
}

extension UITextViewStyle {

    public static var alias: Alias = "UITextViewStyle"
}

extension UITextViewStyle: Codable {

    private enum CodingKeys: String, CodingKey {

        case text
        case font
        case textColor
        case textAlignment
        //    case selectedRang
        case editable
        case dataDetectorTypes
        case attributedText
        case clearsOnInsertion
    }

    public enum UITextViewStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? values.decode(Variable<String>.self, forKey: .text) {
            self = .text(value)
        } else if let value = try? values.decode(Variable<Font>.self, forKey: .font) {
            self = .font(value)
        } else if let value = try? values.decode(Variable<Color>.self, forKey: .textColor) {
            self = .textColor(value)
        } else if let value = try? values.decode(Variable<TextAlignment>.self, forKey: .textAlignment) {
            self = .textAlignment(value)
        }
        //    case selectedRange
        else if let value = try? values.decode(Variable<Bool>.self, forKey: .editable) {
            self = .editable(value)
        } else if let value = try? values.decode(Variable<DataDetectorTypes>.self, forKey: .dataDetectorTypes) {
            self = .dataDetectorTypes(value)
        } else if let value = try? values.decode(Variable<AttributedString>.self, forKey: .attributedText) {
            self = .attributedText(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .clearsOnInsertion) {
            self = .clearsOnInsertion(value)
        } else {
            throw UITextViewStyleCodingError.decoding("\(dump(values))")
        }

    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .text(let value): try container.encode(value, forKey: .text)
        case .font(let value): try container.encode(value, forKey: .font)
        case .textColor(let value): try container.encode(value, forKey: .textColor)
        case .textAlignment(let value): try container.encode(value, forKey: .textAlignment)
        //    case selectedRang
        case .editable(let value): try container.encode(value, forKey: .editable)
        case .dataDetectorTypes(let value): try container.encode(value, forKey: .dataDetectorTypes)
        case .attributedText(let value): try container.encode(value, forKey: .attributedText)
        case .clearsOnInsertion(let value): try container.encode(value, forKey: .clearsOnInsertion)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: UITextViewStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
