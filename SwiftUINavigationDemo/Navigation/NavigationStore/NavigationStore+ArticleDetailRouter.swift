//
//  ArticleDetailRouter.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import Article

extension NavigationStore: ArticleDetailRouterLogic {
    public func navigate(_ route: ArticleDetailRoute) {
        switch route {
        case .back:
            _ = navigationPath.popLast()
        }
    }
}
