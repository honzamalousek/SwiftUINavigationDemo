//
//  NavRootView.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Article
import Categories
import Common
import Foundation
import Homescreen
import SwiftUI
import Filter

public struct NavRootView: View {
    @ObservedObject private var navigationStore: NavigationStore
    @State var isSheetPresented = false

    init(navigationStore: NavigationStore) {
        self.navigationStore = navigationStore
    }

    @State private var path: [String] = []

    public var body: some View {
        NavigationStack(path: $navigationStore.navigationPath) {
            ViewFactory().getView(for: navigationStore.rootNode)
                .navigationDestination(for: Node.self) { destination in
                    ViewFactory().getView(for: destination)
                }
        }
        .onReceive(navigationStore.displayedSheet, perform: { displayedSheet in
            isSheetPresented = displayedSheet != nil
        })
        .sheet(isPresented: $isSheetPresented) {
            if let sheet = navigationStore.displayedSheet.value {
                ViewFactory().getSheet(
                    for: sheet,
                    parentNavigationStore: navigationStore
                )
            }
        }
        .environment(\.homescreenCoordinator, navigationStore)
        .environment(\.categoryCoordinator, navigationStore)
        .environment(\.articleDetailCoordinator, navigationStore)
        .environment(\.filterCoordinator, navigationStore)
        .environment(\.filterTagCollectionCoordinator, navigationStore)
    }
}
