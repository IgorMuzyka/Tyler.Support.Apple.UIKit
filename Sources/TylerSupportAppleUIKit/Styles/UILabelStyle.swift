
import Variable
import Substitutes
import Style
import Tag
import TypePreservingCodingAdapter

public enum UILabelStyle: Style {

    case text(Variable<String>)
    case font(Variable<Font>)
    case textColor(Variable<Color>)
    case textAlignment(Variable<TextAlignment>)
    case numberOfLines(Variable<Int>)
    case lineBreakMode(Variable<LineBreakMode>)
    case minimumScaleFactor(Variable<Number>)
    case adjustsFontSizeToFitWidth(Variable<Bool>)
    case baselineAdjustment(Variable<BaselineAdjustment>)
    case shadowColor(Variable<Color>)
    case shadowOffset(Variable<Size>)
    case highlightedTextColor(Variable<Color>)
    case attributedText(Variable<AttributedString>)
}

extension UILabelStyle {

    public static var alias: Alias = "UILabelStyle"
}

extension UILabelStyle: Codable {

    private enum CodingKeys: String, CodingKey {

        case text
        case font
        case textColor
        case textAlignment
        case numberOfLines
        case lineBreakMode
        case minimumScaleFactor
        case adjustsFontSizeToFitWidth
        case baselineAdjustment
        case shadowColor
        case shadowOffset
        case highlightedTextColor
        case attributedText
    }

    public enum UILabelStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? values.decode(Variable<Font>.self, forKey: .font) {
            self = .font(value)
        } else if let value = try? values.decode(Variable<Color>.self, forKey: .textColor) {
            self = .textColor(value)
        } else if let value = try? values.decode(Variable<TextAlignment>.self, forKey: .textAlignment) {
            self = .textAlignment(value)
        } else if let value = try? values.decode(Variable<Int>.self, forKey: .numberOfLines) {
            self = .numberOfLines(value)
        } else if let value = try? values.decode(Variable<LineBreakMode>.self, forKey: .lineBreakMode) {
            self = .lineBreakMode(value)
        } else if let value = try? values.decode(Variable<Number>.self, forKey: .minimumScaleFactor) {
            self = .minimumScaleFactor(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .adjustsFontSizeToFitWidth) {
            self = .adjustsFontSizeToFitWidth(value)
        } else if let value = try? values.decode(Variable<BaselineAdjustment>.self, forKey: .baselineAdjustment) {
            self = .baselineAdjustment(value)
        } else if let value = try? values.decode(Variable<Color>.self, forKey: .shadowColor) {
            self = .shadowColor(value)
        } else if let value = try? values.decode(Variable<Size>.self, forKey: .shadowOffset) {
            self = .shadowOffset(value)
        } else if let value = try? values.decode(Variable<Color>.self, forKey: .highlightedTextColor) {
            self = .highlightedTextColor(value)
        } else if let value = try? values.decode(Variable<AttributedString>.self, forKey: .attributedText) {
            self = .attributedText(value)
        } else if let value = try? values.decode(Variable<String>.self, forKey: .text) {
            self = .text(value)
        } else {
            throw UILabelStyleCodingError.decoding("\(dump(values))")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .font(let value): try container.encode(value, forKey: .font)
        case .textColor(let value): try container.encode(value, forKey: .textColor)
        case .textAlignment(let value): try container.encode(value, forKey: .textAlignment)
        case .numberOfLines(let value): try container.encode(value, forKey: .numberOfLines)
        case .lineBreakMode(let value): try container.encode(value, forKey: .lineBreakMode)
        case .minimumScaleFactor(let value): try container.encode(value, forKey: .minimumScaleFactor)
        case .adjustsFontSizeToFitWidth(let value): try container.encode(value, forKey: .adjustsFontSizeToFitWidth)
        case .baselineAdjustment(let value): try container.encode(value, forKey: .baselineAdjustment)
        case .shadowColor(let value): try container.encode(value, forKey: .shadowColor)
        case .shadowOffset(let value): try container.encode(value, forKey: .shadowOffset)
        case .highlightedTextColor(let value): try container.encode(value, forKey: .highlightedTextColor)
        case .attributedText(let value): try container.encode(value, forKey: .attributedText)
        case .text(let value): try container.encode(value, forKey: .text)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: UILabelStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
