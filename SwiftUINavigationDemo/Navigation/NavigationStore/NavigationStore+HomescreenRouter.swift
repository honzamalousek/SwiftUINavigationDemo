//
//  HomescreenRouter.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Foundation
import Homescreen

extension NavigationStore: HomescreenRouterLogic {
    public func navigate(_ route: HomescreenRoute) {
        switch route {
        case .category:
            navigationPath.append(CategoryNode())
        }
    }
}
