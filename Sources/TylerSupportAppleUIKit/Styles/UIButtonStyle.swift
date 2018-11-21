
import Variable
import Substitutes
import Style
import Tag

public enum UIButtonStyle: Style {

//    case buttonType(ButtonType)
	case buttonTitle(Variable<String>, Variable<ControlState>)
	case buttonTitleColor(Variable<Color>, Variable<ControlState>)
	case buttonTitleShadowColor(Variable<Color>, Variable<ControlState>)
	case buttonImage(Variable<Image>, Variable<ControlState>)
	case buttonBackgroundImage(Variable<Image>, Variable<ControlState>)
	case buttonAttributedTitle(Variable<AttributedString>, Variable<ControlState>)
	case contentEdgeInsets(Variable<EdgeInsets>)
	case titleEdgeInsets(Variable<EdgeInsets>)
	case reversesTitleShadowWhenHighlighted(Variable<Bool>)
	case imageEdgeInsets(Variable<EdgeInsets>)
	case adjustsImageWhenHighlighted(Variable<Bool>)
	case adjustsImageWhenDisabled(Variable<Bool>)
	case showsTouchWhenHighlighted(Variable<Bool>)
//    case action(Action)
}

extension UIButtonStyle: Codable {

	private enum CodingKeys: String, CodingKey {

//		case buttonType
		case buttonTitle
		case buttonTitleControlState
		case buttonTitleColor
		case buttonTitleColorControlState
		case buttonTitleShadowColor
		case buttonTitleShadowColorControlState
		case buttonImage
		case buttonImageControlState
		case buttonBackgroundImage
		case buttonBackgroundImageControlState
		case buttonAttributedTitle
		case buttonAttributedTitleControlState
		case contentEdgeInsets
		case titleEdgeInsets
		case reversesTitleShadowWhenHighlighted
		case imageEdgeInsets
		case adjustsImageWhenHighlighted
		case adjustsImageWhenDisabled
		case showsTouchWhenHighlighted
	}

	public enum UIButtonStyleCodingError: Error {
		case decoding(String)
	}

	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)

		if
			let value = try? values.decode(Variable<String>.self, forKey: .buttonTitle),
			let state = try? values.decode(Variable<ControlState>.self, forKey: .buttonTitleControlState)
		{
			self = .buttonTitle(value, state)
		} else if
			let value = try? values.decode(Variable<Color>.self, forKey: .buttonTitleColor),
			let state = try? values.decode(Variable<ControlState>.self, forKey: .buttonTitleColorControlState)
		{
			self = .buttonTitleColor(value, state)
		} else if
			let value = try? values.decode(Variable<Color>.self, forKey: .buttonTitleShadowColor),
			let state = try? values.decode(Variable<ControlState>.self, forKey: .buttonTitleShadowColorControlState)
		{
			self = .buttonTitleShadowColor(value, state)
		} else if
			let value = try? values.decode(Variable<Image>.self, forKey: .buttonImage),
			let state = try? values.decode(Variable<ControlState>.self, forKey: .buttonImageControlState)
		{
			self = .buttonImage(value, state)
		} else if
			let value = try? values.decode(Variable<Image>.self, forKey: .buttonBackgroundImage),
			let state = try? values.decode(Variable<ControlState>.self, forKey: .buttonBackgroundImageControlState)
		{
			self = .buttonBackgroundImage(value, state)
		} else if
			let value = try? values.decode(Variable<AttributedString>.self, forKey: .buttonAttributedTitle),
			let state = try? values.decode(Variable<ControlState>.self, forKey: .buttonAttributedTitleControlState)
		{
			self = .buttonAttributedTitle(value, state)
		} else if let value = try? values.decode(Variable<EdgeInsets>.self, forKey: .contentEdgeInsets) {
			self = .contentEdgeInsets(value)
		} else if let value = try? values.decode(Variable<EdgeInsets>.self, forKey: .titleEdgeInsets) {
			self = .titleEdgeInsets(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .reversesTitleShadowWhenHighlighted) {
			self = .reversesTitleShadowWhenHighlighted(value)
		} else if let value = try? values.decode(Variable<EdgeInsets>.self, forKey: .imageEdgeInsets) {
			self = .imageEdgeInsets(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .adjustsImageWhenHighlighted) {
			self = .adjustsImageWhenHighlighted(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .adjustsImageWhenDisabled) {
			self = .adjustsImageWhenDisabled(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .showsTouchWhenHighlighted) {
			self = .showsTouchWhenHighlighted(value)
		} else {
			throw UIButtonStyleCodingError.decoding("\(dump(values))")
		}
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)

		switch self {
		case .buttonTitle(let value, let state):
			try container.encode(value, forKey: .buttonTitle)
			try container.encode(state, forKey: .buttonTitleControlState)
		case .buttonTitleColor(let value, let state):
			try container.encode(value, forKey: .buttonTitleColor)
			try container.encode(state, forKey: .buttonTitleColorControlState)
		case .buttonTitleShadowColor(let value, let state):
			try container.encode(value, forKey: .buttonTitleShadowColor)
			try container.encode(state, forKey: .buttonTitleShadowColorControlState)
		case .buttonImage(let value, let state):
			try container.encode(value, forKey: .buttonImage)
			try container.encode(state, forKey: .buttonImageControlState)
		case .buttonBackgroundImage(let value, let state):
			try container.encode(value, forKey: .buttonBackgroundImage)
			try container.encode(state, forKey: .buttonBackgroundImageControlState)
		case .buttonAttributedTitle(let value, let state):
			try container.encode(value, forKey: .buttonAttributedTitle)
			try container.encode(state, forKey: .buttonAttributedTitleControlState)
		case .contentEdgeInsets(let value): try container.encode(value, forKey: .contentEdgeInsets)
		case .titleEdgeInsets(let value): try container.encode(value, forKey: .titleEdgeInsets)
		case .reversesTitleShadowWhenHighlighted(let value): try container.encode(value, forKey: .reversesTitleShadowWhenHighlighted)
		case .imageEdgeInsets(let value): try container.encode(value, forKey: .imageEdgeInsets)
		case .adjustsImageWhenHighlighted(let value): try container.encode(value, forKey: .adjustsImageWhenHighlighted)
		case .adjustsImageWhenDisabled(let value): try container.encode(value, forKey: .adjustsImageWhenDisabled)
		case .showsTouchWhenHighlighted(let value): try container.encode(value, forKey: .showsTouchWhenHighlighted)
		}
	}
}

extension Stylable {

    @discardableResult
    public func style(_ style: UIButtonStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
