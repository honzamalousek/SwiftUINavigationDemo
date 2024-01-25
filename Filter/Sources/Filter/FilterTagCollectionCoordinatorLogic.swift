//
//  FilterTagCollectionCoordinatorLogic.swift
//
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Foundation
import SwiftUI

public protocol FilterTagCollectionCoordinatorLogic: AnyObject {
    func navigate(_ route: FilterTagCollectionRoute)
}

public enum FilterTagCollectionRoute {
    case back
    case close
    case toHome
    case anotherFilterSheet
}

class DefatulFilterTagCollectionCoordinator: FilterTagCollectionCoordinatorLogic {
    func navigate(_ route: FilterTagCollectionRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var filterTagCollectionCoordinator: FilterTagCollectionCoordinatorLogic {
        get { self[FilterTagCollectionCoordinatorKey.self] }
        set { self[FilterTagCollectionCoordinatorKey.self] = newValue }
    }
}

struct FilterTagCollectionCoordinatorKey: EnvironmentKey {
    static let defaultValue: FilterTagCollectionCoordinatorLogic = DefatulFilterTagCollectionCoordinator()
}
