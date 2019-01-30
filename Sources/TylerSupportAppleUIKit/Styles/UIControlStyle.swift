
import Variable
import Substitutes
import Style
import Tag
import TypePreservingCodingAdapter

public enum UIControlStyle: Style {

    case isEnabled(Variable<Bool>)
    case isSelected(Variable<Bool>)
    case isHighlighted(Variable<Bool>)
}

extension UIControlStyle {

    public static var alias: Alias = "UIControlStyle"
}

extension UIControlStyle: Codable {

    private enum CodingKeys: String, CodingKey {

        case isEnabled
        case isSelected
        case isHighlighted
    }

    public enum UIControlStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? values.decode(Variable<Bool>.self, forKey: .isEnabled) {
            self = .isEnabled(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .isSelected) {
            self = .isSelected(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .isHighlighted) {
            self = .isHighlighted(value)
        } else {
            throw UIControlStyleCodingError.decoding("\(dump(values))")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .isEnabled(let value): try container.encode(value, forKey: .isEnabled)
        case .isSelected(let value): try container.encode(value, forKey: .isSelected)
        case .isHighlighted(let value): try container.encode(value, forKey: .isHighlighted)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: UIControlStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
