//
//  FilterCoordinatorLogic.swift
//
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Foundation
import SwiftUI

public protocol FilterCoordinatorLogic: AnyObject {
    func navigate(_ route: FilterRoute)
}

public enum FilterRoute {
    case close
    case toFilterTagCollection
}

class DefaultFilterCoordinator: FilterCoordinatorLogic {
    func navigate(_ route: FilterRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var filterCoordinator: FilterCoordinatorLogic {
        get { self[FilterCoordinatorKey.self] }
        set { self[FilterCoordinatorKey.self] = newValue }
    }
}

struct FilterCoordinatorKey: EnvironmentKey {
    static let defaultValue: FilterCoordinatorLogic = DefaultFilterCoordinator()
}
