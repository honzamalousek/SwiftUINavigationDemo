//
//  NavigationStore.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Combine
import SwiftUI

public final class NavigationStore: ObservableObject {
    @Published public var navigationPath: [AnyHashable] = []
    @Published public var rootNode: AnyHashable
    public weak var parentNavigationStore: NavigationStore?

    // displayed sheet cant be published property, otherwice on opening/closing sheet, the whole view will be redraws!
    public let childSheetNavigationStore = CurrentValueSubject<NavigationStore?, Never>(nil)

    public init(
        rootNode: AnyHashable,
        parentNavigationStore: NavigationStore?
    ) {
        self.rootNode = rootNode
        self.parentNavigationStore = parentNavigationStore
    }

    public func openSheet(with sheetRoot: AnyHashable) {
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
            guard let node = node as? (any Node) else { return }
            if node.handleNavigationEvent(event: event, navigationStore: self) {
                return
            }
        }

        if let rootNode = rootNode as? any Node,
           rootNode.handleNavigationEvent(event: event, navigationStore: self)
        {
            return
        }

        closeSheet()
        parentNavigationStore?.handleNavigationEvent(event: event)
    }
}

public extension NavigationStore {
    @discardableResult func handleDeeplink(deeplink: Any) -> Bool {
        if let child = childSheetNavigationStore.value {
            if child.handleDeeplink(deeplink: deeplink) {
                return true
            }
        }

        for node in navigationPath.reversed() {
            guard let node = node as? (any Node) else { return false }
            if node.handleDeeplink(deeplink: deeplink, navigationStore: self) {
                childSheetNavigationStore.send(nil)
                return true
            } else {
                _ = navigationPath.popLast()
            }
        }

        if let rootNode = rootNode as? any Node,
           rootNode.handleDeeplink(deeplink: deeplink, navigationStore: self)
        {
            childSheetNavigationStore.send(nil)
            return true
        }

        return false
    }
}

public extension NavigationStore {
    func popToNode(node: any Node) {
        childSheetNavigationStore.send(nil)
        guard let navigationPath = navigationPath as? [any Node] else { return }

        if navigationPath.contains(where: { $0.id == node.id }) {
            while navigationPath.count > 0, navigationPath.last?.id != node.id {
                self.navigationPath = self.navigationPath.dropLast()
            }
            return
        }
        if let rootNode = rootNode as? any Node,
           rootNode.id == node.id
        {
            self.navigationPath = []
            return
        }

        closeSheet()
        parentNavigationStore?.popToNode(node: node)
    }
}
