//
//  NavigationStore+FilterRouter.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 11.02.2024.
//

import Foundation
import Filter

extension NavigationStore: FilterRouterLogic {
    public func navigate(_ route: Filter.FilterRoute) {
        switch route {
        case .close:
            closeSheet()
        case .toFilterTagCollection:
            navigationPath.append(FilterTagCollectionNode())
        }
    }
}
