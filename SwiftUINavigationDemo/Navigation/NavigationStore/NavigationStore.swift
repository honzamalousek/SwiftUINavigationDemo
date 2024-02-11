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
    @Published public var childSheetNode: AnyHashable?

    public init() {}
    
    func openSheet(with node: AnyHashable) {
        childSheetNode = node
    }
    
    func closeSheet() {
        childSheetNode = nil
    }
}
