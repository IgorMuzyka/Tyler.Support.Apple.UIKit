
import Tyler
import Style
import TylerSupportAppleCommon
import TypePreservingCodingAdapter

#if os(iOS) || os(tvOS)
import UIKit

extension Factory {

    public static var defaultUIKit: Factory {
        return Factory()
            .add(UIView.init)
            .add(UILabel.init)
            .add(UIButton.init)
            .add(UIScrollView.init)
            .add(UIImageView.init)
    }
}

extension StylistsStore {

    public static var defaultUIKit: StylistsStore {
        return StylistsStore()
            .add(stylist: UIViewStylist(), for: UIViewStyle.self)
            .add(stylist: UIControlStylist(), for: UIControlStyle.self)
            .add(stylist: CALayerStylist(), for: CALayerStyle.self)
            .add(stylist: UILabelStylist(), for: UILabelStyle.self)
            .add(stylist: UIButtonStylist(), for: UIButtonStyle.self)
            .add(stylist: UIScrollViewStylist(), for: UIScrollViewStyle.self)
            .add(stylist: UIImageViewStylist(), for: UIImageViewStyle.self)
    }
}

#endif

extension TypePreservingCodingAdapter {

    public func registerUIKitSupportStyles() {
        register(style: CALayerStyle.self)
        register(style: UIViewStyle.self)
        register(style: UIControlStyle.self)
        register(style: UILabelStyle.self)
        register(style: UIButtonStyle.self)
        register(style: UIImageViewStyle.self)
        register(style: UIScrollViewStyle.self)
    }
}
