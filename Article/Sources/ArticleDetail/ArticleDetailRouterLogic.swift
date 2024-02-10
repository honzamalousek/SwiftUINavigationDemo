//
//  ArticleDetailRouter.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import SwiftUI

public protocol ArticleDetailRouterLogic: AnyObject {
    func navigate(_ route: ArticleDetailRoute)
}

public enum ArticleDetailRoute: Hashable {
    case back
}

class DefaultArticleRouter: ArticleDetailRouterLogic {
    public func navigate(_ route: ArticleDetailRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var articleDetailRouter: ArticleDetailRouterLogic {
        get { self[ArticleDetailRouterKey.self] }
        set { self[ArticleDetailRouterKey.self] = newValue }
    }
}

struct ArticleDetailRouterKey: EnvironmentKey {
    static let defaultValue: ArticleDetailRouterLogic = DefaultArticleRouter()
}
