//
//  NavigationStore.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Combine
import SwiftUI

public final class NavigationStore: ObservableObject {
    @Published public var rootNode: AnyHashable
    @Published public var navigationPath: [AnyHashable] = []
    @Published public var childSheetNavigationStore: NavigationStore?
    
    public weak var parentNavigationStore: NavigationStore?

    public init(
        rootNode: AnyHashable,
        parentNavigationStore: NavigationStore?
    ) {
        self.rootNode = rootNode
        self.parentNavigationStore = parentNavigationStore
    }
    
    func openSheet(with node: AnyHashable) {
        childSheetNavigationStore = NavigationStore(
            rootNode: node,
            parentNavigationStore: self
        )
    }
    
    func closeSheet() {
        parentNavigationStore?.childSheetNavigationStore = nil
    }
}
