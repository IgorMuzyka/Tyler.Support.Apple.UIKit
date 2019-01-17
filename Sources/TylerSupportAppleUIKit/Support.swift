
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

extension TypePreservingCodingAdapter {

    public func registerUIKitSupportStyles() {
        register(type: CALayerStyle.self)
        register(alias: CALayerStyle.alias, for: CALayerStyle.self)
        register(type: UIViewStyle.self)
        register(alias: UIViewStyle.alias, for: UIViewStyle.self)
        register(type: UIControlStyle.self)
        register(alias: UIControlStyle.alias, for: UIControlStyle.self)
        register(type: UILabelStyle.self)
        register(alias: UILabelStyle.alias, for: UILabelStyle.self)
        register(type: UIButtonStyle.self)
        register(alias: UIButtonStyle.alias, for: UIButtonStyle.self)
        register(type: UIImageViewStyle.self)
        register(alias: UIImageViewStyle.alias, for: UIImageViewStyle.self)
        register(type: UIScrollViewStyle.self)
        register(alias: UIScrollViewStyle.alias, for: UIScrollViewStyle.self)
    }
}

#endif
