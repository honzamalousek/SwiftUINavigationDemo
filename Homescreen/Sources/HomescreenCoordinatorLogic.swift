//
//  HomescreenCoordinatorLogic.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import SwiftUI

public protocol HomescreenCoordinatorLogic: AnyObject {
    func navigate(_ route: HomescreenRoute)
}

public enum HomescreenRoute: Hashable {
    case categories
}

class DefaultHomescreenCoordinator: HomescreenCoordinatorLogic {
    public func navigate(_ route: HomescreenRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var homescreenCoordinator: HomescreenCoordinatorLogic {
        get { self[HomescreenCoordinatorKey.self] }
        set { self[HomescreenCoordinatorKey.self] = newValue }
    }
}

struct HomescreenCoordinatorKey: EnvironmentKey {
    static let defaultValue: HomescreenCoordinatorLogic = DefaultHomescreenCoordinator()
}
