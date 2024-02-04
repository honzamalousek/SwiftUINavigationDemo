//
//  FilterTagCollectionRouter.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Foundation
import Filter
import Common

extension NavigationStore: FilterTagCollectionRouterLogic {
    public func navigate(_ route: FilterTagCollectionRoute) {
        switch route {
        case .back:
            _ = navigationPath.popLast()
        case .close:
            closeSheet()
        case .toHome:
            handleNavigationEvent(event: NavigationEvent.toHome)
        case .anotherFilterSheet:
            openSheet(with: FilterNode())
        }
    }
}

