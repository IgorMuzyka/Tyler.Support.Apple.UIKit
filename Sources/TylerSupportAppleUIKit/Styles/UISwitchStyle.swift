
import Variable
import Substitutes
import Style
import Tag
import TypePreservingCodingAdapter

public enum UISwitchStyle: Style {

    case onTintColor(Variable<Color>)
    case thumbTintColor(Variable<Color>)
    case onImage(Variable<Image>)
    case offImage(Variable<Image>)
    case isOn(Variable<Bool>)
}

extension UISwitchStyle {

    public static var alias: Alias = "UISwitchStyle"
}

extension UISwitchStyle: Codable {

    private enum CodingKeys: String, CodingKey {
        case onTintColor
        case thumbTintColor
        case onImage
        case offImage
        case isOn
    }

    public enum UISwitchStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? values.decode(Variable<Color>.self, forKey: .onTintColor) {
            self = .onTintColor(value)
        } else if let value = try? values.decode(Variable<Color>.self, forKey: .thumbTintColor) {
            self = .thumbTintColor(value)
        } else if let value = try? values.decode(Variable<Image>.self, forKey: .onImage) {
            self = .onImage(value)
        } else if let value = try? values.decode(Variable<Image>.self, forKey: .offImage) {
            self = .offImage(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .isOn) {
            self = .isOn(value)
        } else {
            throw UISwitchStyleCodingError.decoding("\(dump(values))")
        }

    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .onTintColor(let value): try container.encode(value, forKey: .onTintColor)
        case .thumbTintColor(let value): try container.encode(value, forKey: .thumbTintColor)
        case .onImage(let value): try container.encode(value, forKey: .onImage)
        case .offImage(let value): try container.encode(value, forKey: .offImage)
        case .isOn(let value): try container.encode(value, forKey: .isOn)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: UISwitchStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
