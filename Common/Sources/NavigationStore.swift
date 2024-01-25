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
    public let parentNavigationStore: NavigationStore?
    
    // displayed sheet cant be published property, otherwice on opening/closing sheet, the whole view will be redraws!
    public let displayedSheet = CurrentValueSubject<Node?, Never>(nil)

    public init(
        rootNode: Node,
        parentNavigationStore: NavigationStore?
    ) {
        self.rootNode = rootNode
        self.parentNavigationStore = parentNavigationStore
    }

    public func openSheet(with sheetRoot: Node) {
        displayedSheet.send(sheetRoot)
    }

    public func closeSheet() {
        parentNavigationStore?.displayedSheet.send(nil)
    }
}

public extension NavigationStore {
    func handleNavigationEvent(event: Any) {
        navigationPath.reversed().forEach{ node in
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
        
        parentNavigationStore?.popToNode(node: node)
    }
}
