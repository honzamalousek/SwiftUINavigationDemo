//
//  HomescreenRouter.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import SwiftUI

public protocol HomescreenRouterLogic: AnyObject {
    func navigate(_ route: HomescreenRoute)
}

public enum HomescreenRoute: Hashable {
    case categories
}

public extension EnvironmentValues {
    var homescreenRouter: HomescreenRouterLogic {
        get { self[HomescreenRouterKey.self] }
        set { self[HomescreenRouterKey.self] = newValue }
    }
}

struct HomescreenRouterKey: EnvironmentKey {
    static let defaultValue: HomescreenRouterLogic = DefaultHomescreenRouter()
}

class DefaultHomescreenRouter: HomescreenRouterLogic {
    public func navigate(_ route: HomescreenRoute) {
        assertionFailure()
    }
}
