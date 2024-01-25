//
//  FilterCoordinator.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Foundation
import Filter
import Common

extension NavigationStore: FilterCoordinatorLogic {
    public func navigate(_ route: FilterRoute) {
        switch route {
        case .close:
            closeSheet()
        case .toFilterTagCollection:
            navigationPath.append(FilterTagCollectionNode())
        }
    }
}
