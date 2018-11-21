
public enum UIKitViewType: StringLiteralType {

    #warning("this might be incorrect as of Xcode 10 and new SDK bundled with it")

	case view = "__ObjC.UIView.Type"
	case button = "__ObjC.UIButton.Type"
	case label = "__ObjC.UILabel.Type"
	case scrollView = "__ObjC.UIScrollView.Type"
}
