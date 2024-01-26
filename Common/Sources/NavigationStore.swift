//
//  NavigationStore.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Combine
import SwiftUI

public final class NavigationStore: ObservableObject {
    @Published public var navigationPath: [Node] = []
    public let rootNode: Node
    public weak var parentNavigationStore: NavigationStore?

    // displayed sheet cant be published property, otherwice on opening/closing sheet, the whole view will be redraws!
    public let childSheetNavigationStore = CurrentValueSubject<NavigationStore?, Never>(nil)

    public init(
        rootNode: Node,
        parentNavigationStore: NavigationStore?
    ) {
        self.rootNode = rootNode
        self.parentNavigationStore = parentNavigationStore
    }

    public func openSheet(with sheetRoot: Node) {
        childSheetNavigationStore.send(
            NavigationStore(
                rootNode: sheetRoot,
                parentNavigationStore: self
            )
        )
    }

    public func closeSheet() {
        parentNavigationStore?.childSheetNavigationStore.send(nil)
    }
}

public extension NavigationStore {
    func handleNavigationEvent(event: Any) {
        navigationPath.reversed().forEach { node in
            if node.handleNavigationEvent(event: event, navigationStore: self) {
                return
            }
        }

        if rootNode.handleNavigationEvent(event: event, navigationStore: self) { return }

        closeSheet()
        parentNavigationStore?.handleNavigationEvent(event: event)
    }
}

public extension NavigationStore {
    @discardableResult func handleDeeplink(deeplink: Deeplink) -> Bool {
        if let child = childSheetNavigationStore.value {
            if child.handleDeeplink(deeplink: deeplink) {
                return true
            }
        }

        childSheetNavigationStore.send(nil)

        if navigationPath.contains(deeplink.handlerNode) {
            popToNode(node: deeplink.handlerNode)
            navigationPath.last?.handleDeeplink(deeplink: deeplink, navigationStore: self)
            return true
        } else if rootNode == deeplink.handlerNode {
            rootNode.handleDeeplink(deeplink: deeplink, navigationStore: self)
            return true
        }

        if parentNavigationStore == nil {
            navigationPath = [deeplink.handlerNode]
            return true
        }

        return false
    }
}

public extension NavigationStore {
    func popToNode(node: Node) {
        if navigationPath.contains(node) {
            while navigationPath.count > 0, navigationPath.last != node {
                navigationPath = navigationPath.dropLast()
            }
            return
        }

        if rootNode == node {
            navigationPath = []
            return
        }

        closeSheet()
        parentNavigationStore?.popToNode(node: node)
    }
}

open class Deeplink {
    public let handlerNode: Node

    public init(handlerNode: Node) {
        self.handlerNode = handlerNode
    }
}
