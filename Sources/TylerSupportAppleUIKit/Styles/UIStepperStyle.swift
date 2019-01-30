
import Variable
import Substitutes
import Style
import Tag
import TypePreservingCodingAdapter

public enum UIStepperStyle: Style {

    case isContinuous(Variable<Bool>)
    case autorepeat(Variable<Bool>)
    case wraps(Variable<Bool>)
    case value(Variable<Double>)
    case minimumValue(Variable<Double>)
    case maximumValue(Variable<Double>)
    case stepValue(Variable<Double>)
}

extension UIStepperStyle {
    
    public static var alias: Alias = "UIStepperStyle"
}

extension UIStepperStyle: Codable {

    private enum CodingKeys: String, CodingKey {
        case isContinuous
        case autorepeat
        case wraps
        case value
        case minimumValue
        case maximumValue
        case stepValue
    }

    public enum UIStepperStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? values.decode(Variable<Bool>.self, forKey: .isContinuous) {
            self = .isContinuous(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .autorepeat) {
            self = .autorepeat(value)
        } else if let value = try? values.decode(Variable<Bool>.self, forKey: .wraps) {
            self = .wraps(value)
        } else if let value = try? values.decode(Variable<Double>.self, forKey: .value) {
            self = .value(value)
        } else if let value = try? values.decode(Variable<Double>.self, forKey: .minimumValue) {
            self = .minimumValue(value)
        } else if let value = try? values.decode(Variable<Double>.self, forKey: .maximumValue) {
            self = .maximumValue(value)
        } else if let value = try? values.decode(Variable<Double>.self, forKey: .stepValue) {
            self = .stepValue(value)
        } else {
            throw UIStepperStyleCodingError.decoding("\(dump(values))")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .isContinuous(let value): try container.encode(value, forKey: .isContinuous)
        case .autorepeat(let value): try container.encode(value, forKey: .autorepeat)
        case .wraps(let value): try container.encode(value, forKey: .wraps)
        case .value(let value): try container.encode(value, forKey: .value)
        case .minimumValue(let value): try container.encode(value, forKey: .minimumValue)
        case .maximumValue(let value): try container.encode(value, forKey: .maximumValue)
        case .stepValue(let value): try container.encode(value, forKey: .stepValue)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: UIStepperStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
