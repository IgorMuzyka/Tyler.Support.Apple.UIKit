
import Tyler
import Style
import TylerSupportAppleCommon

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

extension StylesSerializersStore {

    public static var defaultUIKit: StylesSerializersStore {
        return StylesSerializersStore(decoder: JSONDecoder())
            .register(UIViewStyle.self)
            .register(UIControlStyle.self)
            .register(CALayerStyle.self)
            .register(UILabelStyle.self)
            .register(UIButtonStyle.self)
            .register(UIScrollViewStyle.self)
            .register(UIImageViewStyle.self)
    }
}

#endif
