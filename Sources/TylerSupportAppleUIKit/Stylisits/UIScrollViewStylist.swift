
import Style
import Tag
import Variable

#if os(iOS) || os(tvOS)
import UIKit

open class UIScrollViewStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public required init() {}

	public func style(stylable scrollView: UIScrollView, style: UIScrollViewStyle, tags: [Tag], pair: VariableResolutionPair) throws {
		switch style {
		case .isScrollEnabled(let value): scrollView.isScrollEnabled = try value.resolve(pair)
		case .contentOffset(let value): scrollView.contentOffset = try value.resolve(pair).native
		case .contentSize(let value): scrollView.contentSize = try value.resolve(pair).native
		case .contentInset(let value): scrollView.contentInset = try value.resolve(pair).native
		case .isDirectionalLockEnabled(let value): scrollView.isDirectionalLockEnabled = try value.resolve(pair)
		case .bounces(let value): scrollView.bounces = try value.resolve(pair)
		case .alwaysBounceVertical(let value): scrollView.alwaysBounceVertical = try value.resolve(pair)
		case .alwaysBounceHorizontal(let value): scrollView.alwaysBounceHorizontal = try value.resolve(pair)
		case .isPagingEnabled(let value): scrollView.isPagingEnabled = try value.resolve(pair)
		case .showsHorizontalScrollIndicator(let value): scrollView.showsHorizontalScrollIndicator = try value.resolve(pair)
		case .showsVerticalScrollIndicator(let value): scrollView.showsVerticalScrollIndicator = try value.resolve(pair)
		case .scrollIndicatorInsets(let value): scrollView.scrollIndicatorInsets = try value.resolve(pair).native
		case .indicatorStyle(let value): scrollView.indicatorStyle = try value.resolve(pair).native!
		case .decelerationRate(let value): scrollView.decelerationRate = UIScrollView.DecelerationRate(rawValue: try value.resolve(pair).native)
		case .delaysContentTouches(let value): scrollView.delaysContentTouches = try value.resolve(pair)
		case .canCancelContentTouches(let value): scrollView.canCancelContentTouches = try value.resolve(pair)
		case .minimumZoomScale(let value): scrollView.minimumZoomScale = try value.resolve(pair).native
		case .maximumZoomScale(let value): scrollView.maximumZoomScale = try value.resolve(pair).native
		case .zoomScale(let value): scrollView.zoomScale = try value.resolve(pair).native
		case .bouncesZoom(let value): scrollView.bouncesZoom = try value.resolve(pair)
		case .scrollsToTop(let value): scrollView.scrollsToTop = try value.resolve(pair)
		case .keyboardDismissMode(let value): scrollView.keyboardDismissMode = try value.resolve(pair).native!
		}
	}
}

#endif
