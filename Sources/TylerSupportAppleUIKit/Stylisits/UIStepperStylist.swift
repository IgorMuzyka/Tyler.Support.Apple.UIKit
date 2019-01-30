
import Style
import Tag
import Variable

#if os(iOS) || os(tvOS)
import UIKit

open class UIStepperStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public required init() {}

    public func style(stylable stepper: UIStepper, style: UIStepperStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .isContinuous(let value): stepper.isContinuous = try value.resolve(pair)
        case .autorepeat(let value): stepper.autorepeat = try value.resolve(pair)
        case .wraps(let value): stepper.wraps = try value.resolve(pair)
        case .value(let value): stepper.value = try value.resolve(pair)
        case .minimumValue(let value): stepper.minimumValue = try value.resolve(pair)
        case .maximumValue(let value): stepper.maximumValue = try value.resolve(pair)
        case .stepValue(let value): stepper.stepValue = try value.resolve(pair)
        }
    }
}

#endif
