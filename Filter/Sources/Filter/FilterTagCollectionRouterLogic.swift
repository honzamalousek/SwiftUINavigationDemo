//
//  FilterTagCollectionRouterLogic.swift
//
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Foundation
import SwiftUI

public protocol FilterTagCollectionRouterLogic: AnyObject {
    func navigate(_ route: FilterTagCollectionRoute)
}

public enum FilterTagCollectionRoute {
    case back
    case close
    case toHome
    case anotherFilterSheet
}

class DefaultFilterTagCollectionRouter: FilterTagCollectionRouterLogic {
    func navigate(_ route: FilterTagCollectionRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var filterTagCollectionRouter: FilterTagCollectionRouterLogic {
        get { self[FilterTagCollectionRouterKey.self] }
        set { self[FilterTagCollectionRouterKey.self] = newValue }
    }
}

struct FilterTagCollectionRouterKey: EnvironmentKey {
    static let defaultValue: FilterTagCollectionRouterLogic = DefaultFilterTagCollectionRouter()
}
