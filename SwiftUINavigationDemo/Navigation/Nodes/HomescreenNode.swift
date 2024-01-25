//
//  HomescreenNode.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Common
import Homescreen

class HomescreenNode: Node {
    override func handleNavigationEvent(
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
}
