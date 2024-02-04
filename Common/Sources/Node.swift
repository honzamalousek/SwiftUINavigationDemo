//
//  Node.swift
//
//
//  Created by Jan Maloušek on 25.01.2024.
//

public protocol Node: Hashable, Equatable {
    var id: String { get }
    
    func handleNavigationEvent(
        event: Any,
        navigationStore: NavigationStore
    ) -> Bool
    
    func handleDeeplink(
        deeplink: Any,
        navigationStore: NavigationStore
    ) -> Bool
}

public extension Node {
    var id: String { String(describing: type(of: self)) }
    
    func handleNavigationEvent(
        event: Any,
        navigationStore: NavigationStore
    ) -> Bool { false }
    
    func handleDeeplink(
        deeplink: Any,
        navigationStore: NavigationStore
    ) -> Bool { false }
}
