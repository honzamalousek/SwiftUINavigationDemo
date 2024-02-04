//
//  FilterRouterLogic.swift
//
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Foundation
import SwiftUI

public protocol FilterRouterLogic: AnyObject {
    func navigate(_ route: FilterRoute)
}

public enum FilterRoute {
    case close
    case toFilterTagCollection
}

class DefaultFilterRouter: FilterRouterLogic {
    func navigate(_ route: FilterRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var filterRouter: FilterRouterLogic {
        get { self[FilterRouterKey.self] }
        set { self[FilterRouterKey.self] = newValue }
    }
}

struct FilterRouterKey: EnvironmentKey {
    static let defaultValue: FilterRouterLogic = DefaultFilterRouter()
}
