//
//  CategoriesCoordinatorLogic.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import SwiftUI

public protocol CategoriesCoordinatorLogic: AnyObject {
    func navigate(_ route: CategoriesRoute)
}

public enum CategoriesRoute: Hashable {
    case home
    case back
    case articleDetail(articleId: String)
    case filter
}

class DefaultCategoriesCoordinator: CategoriesCoordinatorLogic {
    public func navigate(_ route: CategoriesRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var categoryCoordinator: CategoriesCoordinatorLogic {
        get { self[CategoriesCoordinatorKey.self] }
        set { self[CategoriesCoordinatorKey.self] = newValue }
    }
}

struct CategoriesCoordinatorKey: EnvironmentKey {
    static let defaultValue: CategoriesCoordinatorLogic = DefaultCategoriesCoordinator()
}

