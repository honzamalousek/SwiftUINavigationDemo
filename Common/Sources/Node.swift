//
//  Node.swift
//
//
//  Created by Jan Maloušek on 25.01.2024.
//

open class Node: Hashable {
    private let id: String

    public init(id: String? = nil) {
        if let id {
            self.id = id
        } else {
            self.id = String(describing: type(of: self))
        }
    }

    open func handleNavigationEvent(
        event: Any,
        navigationStore: NavigationStore
    ) -> Bool {
        false
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.id == rhs.id
    }
}
