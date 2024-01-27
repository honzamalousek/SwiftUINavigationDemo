//
//  HomescreenNode.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Common
import Homescreen

struct HomescreenNode: Node {
    func handleNavigationEvent(
        event: Any,
        navigationStore: NavigationStore
    ) -> Bool {
        guard let event = event as? NavigationEvent else { return false }
        switch event {
        case .toHome:
            navigationStore.popToNode(node: self)
            return true
        }
    }
    
    func handleDeeplink(
        deeplink: Any,
        navigationStore: NavigationStore
    ) -> Bool {
        guard let deeplink = deeplink as? Deeplink else { return false }
        switch deeplink {
        case .prefilledArticleDetail:
            handlePrefilledArticleDetailDeeplink(
                deeplink: deeplink,
                navigationStore: navigationStore
            )
            return true
        }
    }
}

extension HomescreenNode {
    func handlePrefilledArticleDetailDeeplink(
        deeplink: Deeplink,
        navigationStore: NavigationStore
    ) {
        let categoryNode = CategoryNode()
        navigationStore.navigationPath.append(categoryNode)
        _ = categoryNode.handleDeeplink(
            deeplink: deeplink,
            navigationStore: navigationStore
        )
    }
}
