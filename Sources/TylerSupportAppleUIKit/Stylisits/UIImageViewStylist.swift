
import Style
import Tag
import Variable
import Kingfisher

#if os(iOS) || os(tvOS)
import UIKit

open class UIImageViewStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public required init() {}

    public func style(stylable view: UIImageView, style: UIImageViewStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .image(let value): view.image = try value.resolve(pair)??.native
        case .highlightedImage(let value): view.highlightedImage = try value.resolve(pair)??.native
        case .isHighlighted(let value): view.isHighlighted = try value.resolve(pair)
        case .url(let value):
            let url = URL(string: value.resolve.pair)
            view.setImage(with: url)
        }
    }
}

#endif
