
import Variable
import Substitutes
import Style
import Tag

public enum UIImageViewStyle: Style {

    case image(Variable<Image?>)
    case highlightedImage(Variable<Image?>)
    case isHighlighted(Variable<Bool>)
    case url(Variable<String>)

    private enum CodingKeys: String, CodingKey {
        case image
        case highlightedImage
        case isHighlighted
        case url
    }

    public enum UIImageViewStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? values.decode(Variable<Image?>.self, forKey: .image) {
            self = .image(value)
        } else if let value = try? values.decode(Variable<Image?>.self, forKey: .highlightedImage) {
            self = .highlightedImage(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .isHighlighted) {
            self = .isHighlighted(value)
        } else if let value = try? values.decode(Variable<String>.self, forKey: .url) {
            self. url(value)
        } else {
            throw UIImageViewStyleCodingError.decoding("\(dump(values))")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .image(let value): try container.encode(value, forKey: .image)
        case .highlightedImage(let value): try container.encode(value, forKey: .highlightedImage)
        case .isHighlighted(let value): try container.encode(value, forKey: .isHighlighted)
        case .url(let value): try container.encode(value, forKey: .url)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: UIImageViewStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
