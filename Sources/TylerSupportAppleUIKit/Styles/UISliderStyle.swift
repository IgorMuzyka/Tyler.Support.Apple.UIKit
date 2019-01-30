
import Variable
import Substitutes
import Style
import Tag
import TypePreservingCodingAdapter

public enum UISliderStyle: Style {

    case value(Variable<Float>)
    case minimumValue(Variable<Float>)
    case maximumValue(Variable<Float>)
    case minimumValueImage(Variable<Image>)
    case maximumValueImage(Variable<Image>)
    case isContinuous(Variable<Bool>)
    case minimumTrackTintColor(Variable<Color>)
    case maximumTrackTintColor(Variable<Color>)
    case thumbTintColor(Variable<Color>)
}

extension UISliderStyle {

    public static var alias: Alias = "UISliderStyle"
}

extension UISliderStyle: Codable {

    private enum CodingKeys: String, CodingKey {
        case value
        case minimumValue
        case maximumValue
        case minimumValueImage
        case maximumValueImage
        case isContinuous
        case minimumTrackTintColor
        case maximumTrackTintColor
        case thumbTintColor
    }

    public enum UISliderStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? values.decode(Variable<Float>.self, forKey: .value) {
            self = .value(value)
        } else if let value = try? values.decode(Variable<Float>.self, forKey: .minimumValue) {
            self = .minimumValue(value)
        } else if let value = try? values.decode(Variable<Float>.self, forKey: .maximumValue) {
            self = .maximumValue(value)
        } else if let value = try? values.decode(Variable<Image>.self, forKey: .minimumValueImage) {
            self = .minimumValueImage(value)
        } else if let value = try? values.decode(Variable<Image>.self, forKey: .maximumValueImage) {
            self = .maximumValueImage(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .isContinuous) {
            self = .isContinuous(value)
        } else if let value = try? values.decode(Variable<Color>.self, forKey: .minimumTrackTintColor) {
            self = .minimumTrackTintColor(value)
        } else if let value = try? values.decode(Variable<Color>.self, forKey: .maximumTrackTintColor) {
            self = .maximumTrackTintColor(value)
        } else if let value = try? values.decode(Variable<Color>.self, forKey: .thumbTintColor) {
            self = .thumbTintColor(value)
        } else {
            throw UISliderStyleCodingError.decoding("\(dump(values))")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .value(let value): try container.encode(value, forKey: .value)
        case .minimumValue(let value): try container.encode(value, forKey: .minimumValue)
        case .maximumValue(let value): try container.encode(value, forKey: .maximumValue)
        case .minimumValueImage(let value): try container.encode(value, forKey: .minimumValueImage)
        case .maximumValueImage(let value): try container.encode(value, forKey: .maximumValueImage)
        case .isContinuous(let value): try container.encode(value, forKey: .isContinuous)
        case .minimumTrackTintColor(let value): try container.encode(value, forKey: .minimumTrackTintColor)
        case .maximumTrackTintColor(let value): try container.encode(value, forKey: .maximumTrackTintColor)
        case .thumbTintColor(let value): try container.encode(value, forKey: .thumbTintColor)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: UISliderStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
