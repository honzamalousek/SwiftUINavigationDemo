//
//  ArticleDetailCoordinatorLogic.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import SwiftUI

public protocol ArticleDetailCoordinatorLogic: AnyObject {
    func navigate(_ route: ArticleDetailRoute)
}

public enum ArticleDetailRoute: Hashable {
    case home
    case back
}

class DefaultArticleCoordinator: ArticleDetailCoordinatorLogic {
    public func navigate(_ route: ArticleDetailRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var articleDetailCoordinator: ArticleDetailCoordinatorLogic {
        get { self[ArticleDetailCoordinatorKey.self] }
        set { self[ArticleDetailCoordinatorKey.self] = newValue }
    }
}

struct ArticleDetailCoordinatorKey: EnvironmentKey {
    static let defaultValue: ArticleDetailCoordinatorLogic = DefaultArticleCoordinator()
}
