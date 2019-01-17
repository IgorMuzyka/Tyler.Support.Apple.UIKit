
import Variable
import Substitutes
import Style
import Tag
import TypePreservingCodingAdapter

public enum UIScrollViewStyle: Style {

	case isScrollEnabled(Variable<Bool>)
	case contentOffset(Variable<Point>)
	case contentSize(Variable<Size>)
	case contentInset(Variable<EdgeInsets>)
	case isDirectionalLockEnabled(Variable<Bool>)
	case bounces(Variable<Bool>)
	case alwaysBounceVertical(Variable<Bool>)
	case alwaysBounceHorizontal(Variable<Bool>)
	case isPagingEnabled(Variable<Bool>)
	case showsHorizontalScrollIndicator(Variable<Bool>)
	case showsVerticalScrollIndicator(Variable<Bool>)
	case scrollIndicatorInsets(Variable<EdgeInsets>)
	case indicatorStyle(Variable<ScrollViewIndicatorStyle>)
	case decelerationRate(Variable<Number>)
	case delaysContentTouches(Variable<Bool>)
	case canCancelContentTouches(Variable<Bool>)
	case minimumZoomScale(Variable<Number>)
	case maximumZoomScale(Variable<Number>)
	case zoomScale(Variable<Number>)
	case bouncesZoom(Variable<Bool>)
	case scrollsToTop(Variable<Bool>)
	case keyboardDismissMode(Variable<ScrollViewKeyboardDismissMode>)
}

extension UIScrollViewStyle {

    public static var alias: Alias = "UIScrollViewStyle"
}

extension UIScrollViewStyle: Codable {

	private enum CodingKeys: String, CodingKey {
		case isScrollEnabled
		case contentOffset
		case contentSize
		case contentInset
		case isDirectionalLockEnabled
		case bounces
		case alwaysBounceVertical
		case alwaysBounceHorizontal
		case isPagingEnabled
		case showsHorizontalScrollIndicator
		case showsVerticalScrollIndicator
		case scrollIndicatorInsets
		case indicatorStyle
		case decelerationRate
		case delaysContentTouches
		case canCancelContentTouches
		case minimumZoomScale
		case maximumZoomScale
		case zoomScale
		case bouncesZoom
		case scrollsToTop
		case keyboardDismissMode
	}

	public enum UIScrollViewStyleCodingError: Error {
		case decoding(String)
	}

	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)

		if let value = try? values.decode(Variable<Bool>.self, forKey: .isScrollEnabled) {
			self = .isScrollEnabled(value)
		} else if let value = try? values.decode(Variable<Point>.self, forKey: .contentOffset) {
			self = .contentOffset(value)
		} else if let value = try? values.decode(Variable<Size>.self, forKey: .contentSize) {
			self = .contentSize(value)
		} else if let value = try? values.decode(Variable<EdgeInsets>.self, forKey: .contentInset) {
			self = .contentInset(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .isDirectionalLockEnabled) {
			self = .isDirectionalLockEnabled(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .bounces) {
			self = .bounces(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .alwaysBounceVertical) {
			self = .alwaysBounceVertical(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .alwaysBounceHorizontal) {
			self = .alwaysBounceHorizontal(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .isPagingEnabled) {
			self = .isPagingEnabled(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .showsHorizontalScrollIndicator) {
			self = .showsHorizontalScrollIndicator(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .showsVerticalScrollIndicator) {
			self = .showsVerticalScrollIndicator(value)
		} else if let value = try? values.decode(Variable<EdgeInsets>.self, forKey: .scrollIndicatorInsets) {
			self = .scrollIndicatorInsets(value)
		} else if let value = try? values.decode(Variable<ScrollViewIndicatorStyle>.self, forKey: .indicatorStyle) {
			self = .indicatorStyle(value)
		} else if let value = try? values.decode(Variable<Number>.self, forKey: .decelerationRate) {
			self = .decelerationRate(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .delaysContentTouches) {
			self = .delaysContentTouches(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .canCancelContentTouches) {
			self = .canCancelContentTouches(value)
		} else if let value = try? values.decode(Variable<Number>.self, forKey: .minimumZoomScale) {
			self = .minimumZoomScale(value)
		} else if let value = try? values.decode(Variable<Number>.self, forKey: .maximumZoomScale) {
			self = .maximumZoomScale(value)
		} else if let value = try? values.decode(Variable<Number>.self, forKey: .zoomScale) {
			self = .zoomScale(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .bouncesZoom) {
			self = .bouncesZoom(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .scrollsToTop) {
			self = .scrollsToTop(value)
		} else if let value = try? values.decode(Variable<ScrollViewKeyboardDismissMode>.self, forKey: .keyboardDismissMode) {
			self = .keyboardDismissMode(value)
		} else {
			throw UIScrollViewStyleCodingError.decoding("\(dump(values))")
		}
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)

		switch self {
		case .isScrollEnabled(let value): try container.encode(value, forKey: .isScrollEnabled)
		case .contentOffset(let value): try container.encode(value, forKey: .contentOffset)
		case .contentSize(let value): try container.encode(value, forKey: .contentSize)
		case .contentInset(let value): try container.encode(value, forKey: .contentInset)
		case .isDirectionalLockEnabled(let value): try container.encode(value, forKey: .isDirectionalLockEnabled)
		case .bounces(let value): try container.encode(value, forKey: .bounces)
		case .alwaysBounceVertical(let value): try container.encode(value, forKey: .alwaysBounceVertical)
		case .alwaysBounceHorizontal(let value): try container.encode(value, forKey: .alwaysBounceHorizontal)
		case .isPagingEnabled(let value): try container.encode(value, forKey: .isPagingEnabled)
		case .showsHorizontalScrollIndicator(let value): try container.encode(value, forKey: .showsHorizontalScrollIndicator)
		case .showsVerticalScrollIndicator(let value): try container.encode(value, forKey: .showsVerticalScrollIndicator)
		case .scrollIndicatorInsets(let value): try container.encode(value, forKey: .scrollIndicatorInsets)
		case .indicatorStyle(let value): try container.encode(value, forKey: .indicatorStyle)
		case .decelerationRate(let value): try container.encode(value, forKey: .decelerationRate)
		case .delaysContentTouches(let value): try container.encode(value, forKey: .delaysContentTouches)
		case .canCancelContentTouches(let value): try container.encode(value, forKey: .canCancelContentTouches)
		case .minimumZoomScale(let value): try container.encode(value, forKey: .minimumZoomScale)
		case .maximumZoomScale(let value): try container.encode(value, forKey: .maximumZoomScale)
		case .zoomScale(let value): try container.encode(value, forKey: .zoomScale)
		case .bouncesZoom(let value): try container.encode(value, forKey: .bouncesZoom)
		case .scrollsToTop(let value): try container.encode(value, forKey: .scrollsToTop)
		case .keyboardDismissMode(let value): try container.encode(value, forKey: .keyboardDismissMode)
		}
	}
}

extension Stylable {

	@discardableResult
    public func style(_ style: UIScrollViewStyle, tags: [Tag] = []) -> Self {
		return self.style(style: style, tags: tags)
	}
}
