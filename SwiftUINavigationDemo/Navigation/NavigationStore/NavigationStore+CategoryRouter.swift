//
//  CategoryRouter.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import Category

extension NavigationStore: CategoryRouterLogic {
    public func navigate(_ route: CategoryRoute) {
        switch route {
        case .back:
            _ = navigationPath.popLast()
        case let .articleDetail(articleId):
            navigationPath.append(ArticleDetailNode(articleId: articleId))
        }
    }
}
