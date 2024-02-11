//
//  NavigationStore+FilterTagCollectionRouter.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 11.02.2024.
//

import Foundation
import Filter

extension NavigationStore: FilterTagCollectionRouterLogic {
    public func navigate(_ route: Filter.FilterTagCollectionRoute) {
        switch route {
        case .back:
            _ = navigationPath.popLast()
        case .close:
            closeSheet()
        case .anotherFilterSheet:
            openSheet(with: FilterNode())
        }
    }
}
