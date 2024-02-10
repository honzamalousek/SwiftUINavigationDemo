//
//  CategoryRouter.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import Categories

extension NavigationStore: CategoriesRouterLogic {
    public func navigate(_ route: CategoriesRoute) {
        switch route {
        case .back:
            _ = navigationPath.popLast()
        case let .articleDetail(articleId):
            navigationPath.append(ArticleDetailNode(articleId: articleId))
        }
    }
}
