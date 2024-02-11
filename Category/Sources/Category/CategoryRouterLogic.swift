//
//  CategoryRouterLogic.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import SwiftUI

public protocol CategoryRouterLogic: AnyObject {
    func navigate(_ route: CategoryRoute)
}

public enum CategoryRoute {
    case back
    case articleDetail(articleId: String)
    case filterSheet
}

class DefaultCategoryRouter: CategoryRouterLogic {
    public func navigate(_ route: CategoryRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var categoryRouter: CategoryRouterLogic {
        get { self[CategoryRouterKey.self] }
        set { self[CategoryRouterKey.self] = newValue }
    }
}

struct CategoryRouterKey: EnvironmentKey {
    static let defaultValue: CategoryRouterLogic = DefaultCategoryRouter()
}

