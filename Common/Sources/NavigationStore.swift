//
//  NavigationStore.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Combine
import SwiftUI

public final class NavigationStore: ObservableObject {
    @Published public var navigationPath: [any Node] = []
    @Published public var rootNode: any Node
    @Published public var childSheetNavigationStore: NavigationStore?

    public weak var parentNavigationStore: NavigationStore?

    public init(
        rootNode: any Node,
        parentNavigationStore: NavigationStore?
    ) {
        self.rootNode = rootNode
        self.parentNavigationStore = parentNavigationStore
    }

    public func openSheet(with sheetRoot: any Node) {
        childSheetNavigationStore = NavigationStore(
            rootNode: sheetRoot,
            parentNavigationStore: self
        )
    }

    public func closeSheet() {
        parentNavigationStore?.childSheetNavigationStore = nil
    }
}

public extension NavigationStore {
    func handleNavigationEvent(event: Any) {
        navigationPath.reversed().forEach { node in
            if node.handleNavigationEvent(event: event, navigationStore: self) {
                return
            }
        }

        if rootNode.handleNavigationEvent(event: event, navigationStore: self) {
            return
        }

        closeSheet()
        parentNavigationStore?.handleNavigationEvent(event: event)
    }
}

public extension NavigationStore {
    @discardableResult func handleDeeplink(deeplink: Any) -> Bool {
        if let child = childSheetNavigationStore {
            if child.handleDeeplink(deeplink: deeplink) {
                return true
            }
        }

        for node in navigationPath.reversed() {
            if node.handleDeeplink(deeplink: deeplink, navigationStore: self) {
                childSheetNavigationStore = nil
                return true
            } else {
                _ = navigationPath.popLast()
            }
        }

        if rootNode.handleDeeplink(deeplink: deeplink, navigationStore: self) {
            childSheetNavigationStore = nil
            return true
        }

        return false
    }
}

public extension NavigationStore {
    func popToNode(node: any Node) {
        childSheetNavigationStore = nil
        if navigationPath.contains(where: { $0.id == node.id }) {
            while navigationPath.count > 0, navigationPath.last?.id != node.id {
                navigationPath = navigationPath.dropLast()
            }
            return
        }
        if rootNode.id == node.id {
            navigationPath = []
            return
        }

        closeSheet()
        parentNavigationStore?.popToNode(node: node)
    }
}
