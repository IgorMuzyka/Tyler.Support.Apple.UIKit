
import Variable
import Substitutes
import Style
import Tag
import TypePreservingCodingAdapter

public enum UIViewStyle: Style {

	case isUserInteractionEnabled(Variable<Bool>)
	case translatesAutoresizingMaskIntoConstraints(Variable<Bool>)
	case backgroundColor(Variable<Color>)
	case tintColor(Variable<Color>)
	case tintAdjustmentMode(Variable<ViewTintAdjustmentMode>)
	case isMultipleTouchEnabled(Variable<Bool>)
	case isExclusiveTouch(Variable<Bool>)
	case clipsToBounds(Variable<Bool>)
	case alpha(Variable<Number>)
	case isOpaque(Variable<Bool>)
	case clearsContextBeforeDrawing(Variable<Bool>)
	case isHidden(Variable<Bool>)
	case contentMode(Variable<ViewContentMode>)
}

extension UIViewStyle {

    public static var alias: Alias = "UIViewStyle"
}

extension UIViewStyle: Codable {

    private enum CodingKeys: String, CodingKey {

        case isUserInteractionEnabled
        case translatesAutoresizingMaskIntoConstraints
        case backgroundColor
        case tintColor
        case tintAdjustmentMode
        case isMultipleTouchEnabled
        case isExclusiveTouch
        case clipsToBounds
        case alpha
        case isOpaque
        case clearsContextBeforeDrawing
        case isHidden
        case contentMode
    }

    public enum UIViewStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

		if let value = try? values.decode(Variable<Bool>.self, forKey: .isUserInteractionEnabled) {
			self = .isUserInteractionEnabled(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .isUserInteractionEnabled) {
			self = .isUserInteractionEnabled(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .translatesAutoresizingMaskIntoConstraints) {
			self = .translatesAutoresizingMaskIntoConstraints(value)
		} else if let value = try? values.decode(Variable<Color>.self, forKey: .backgroundColor) {
			self = .backgroundColor(value)
		} else if let value = try? values.decode(Variable<Color>.self, forKey: .tintColor) {
			self = .tintColor(value)
		} else if let value = try? values.decode(Variable<ViewTintAdjustmentMode>.self, forKey: .tintAdjustmentMode) {
			self = .tintAdjustmentMode(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .isMultipleTouchEnabled) {
			self = .isMultipleTouchEnabled(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .isExclusiveTouch) {
			self = .isExclusiveTouch(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .clipsToBounds) {
			self = .clipsToBounds(value)
		} else if let value = try? values.decode(Variable<Number>.self, forKey: .alpha) {
			self = .alpha(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .isOpaque) {
			self = .isOpaque(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .clearsContextBeforeDrawing) {
			self = .clearsContextBeforeDrawing(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .isHidden) {
			self = .isHidden(value)
		} else if let value = try? values.decode(Variable<ViewContentMode>.self, forKey: .contentMode) {
			self = .contentMode(value)
		} else {
            throw UIViewStyleCodingError.decoding("\(dump(values))")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .isUserInteractionEnabled(let value): try container.encode(value, forKey: .isUserInteractionEnabled)
        case .translatesAutoresizingMaskIntoConstraints(let value): try container.encode(value, forKey: .translatesAutoresizingMaskIntoConstraints)
        case .backgroundColor(let value): try container.encode(value, forKey: .backgroundColor)
        case .tintColor(let value): try container.encode(value, forKey: .tintColor)
        case .tintAdjustmentMode(let value): try container.encode(value, forKey: .tintAdjustmentMode)
        case .isMultipleTouchEnabled(let value): try container.encode(value, forKey: .isMultipleTouchEnabled)
        case .isExclusiveTouch(let value): try container.encode(value, forKey: .isExclusiveTouch)
        case .clipsToBounds(let value): try container.encode(value, forKey: .clipsToBounds)
        case .alpha(let value): try container.encode(value, forKey: .alpha)
        case .isOpaque(let value): try container.encode(value, forKey: .isOpaque)
        case .clearsContextBeforeDrawing(let value): try container.encode(value, forKey: .clearsContextBeforeDrawing)
        case .isHidden(let value): try container.encode(value, forKey: .isHidden)
        case .contentMode(let value): try container.encode(value, forKey: .contentMode)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: UIViewStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
