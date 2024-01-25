//
//  ArticleDetailCoordinator.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import Article
import Common

extension NavigationStore: ArticleDetailCoordinatorLogic {
    public func navigate(_ route: ArticleDetailRoute) {
        switch route {
        case .home:
            handleNavigationEvent(event: NavigationEvent.toHome)
        case .back:
            _ = navigationPath.popLast()
        }
    }
}
