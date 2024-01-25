//
//  CategoryCoordinator.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import Common
import Categories

extension NavigationStore: CategoriesCoordinatorLogic {
    public func navigate(_ route: CategoriesRoute) {
        switch route {
        case .home:
            handleNavigationEvent(event: NavigationEvent.toHome)
        case .back:
            _ = navigationPath.popLast()
        case let .articleDetail(articleId):
            navigationPath.append(ArticleDetailNode(articleId: articleId))
        case .filter:
            openSheet(with: FilterNode())
        }
    }
}
