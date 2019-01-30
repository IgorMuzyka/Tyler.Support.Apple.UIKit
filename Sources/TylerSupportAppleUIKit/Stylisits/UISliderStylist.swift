
import Style
import Tag
import Variable

#if os(iOS) || os(tvOS)
import UIKit

open class UISliderStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public required init() {}

    public func style(stylable slider: UISlider, style: UISliderStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .value(let value): slider.value = try value.resolve(pair)
        case .minimumValue(let value): slider.minimumValue = try value.resolve(pair)
        case .maximumValue(let value): slider.maximumValue = try value.resolve(pair)
        case .minimumValueImage(let value): slider.minimumValueImage = try value.resolve(pair).native
        case .maximumValueImage(let value): slider.maximumValueImage = try value.resolve(pair).native
        case .isContinuous(let value): slider.isContinuous = try value.resolve(pair)
        case .minimumTrackTintColor(let value): slider.minimumTrackTintColor = try value.resolve(pair).native
        case .maximumTrackTintColor(let value): slider.maximumTrackTintColor = try value.resolve(pair).native
        case .thumbTintColor(let value): slider.thumbTintColor = try value.resolve(pair).native
        }
    }
}

#endif
