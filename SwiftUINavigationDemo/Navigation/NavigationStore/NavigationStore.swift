//
//  NavigationStore.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Combine
import SwiftUI
import Homescreen

public final class NavigationStore: ObservableObject {
    @Published public var navigationPath: [AnyHashable] = []

    public init() {}
}
