//
//  NavRootView.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Article
import Category
import Filter
import Foundation
import Homescreen
import SwiftUI

struct NavRootView: View {
    @ObservedObject private var navigationStore: NavigationStore

    public init(navigationStore: NavigationStore) {
        self.navigationStore = navigationStore
    }

    var body: some View {
        NavigationStack(path: $navigationStore.navigationPath) {
            HomescreenView()
                .navigationDestination(for: AnyHashable.self) { node in
                    ViewFactory().getView(for: node)
                }
        }
        .sheet(isPresented: .init(
            get: { navigationStore.childSheetNode != nil },
            set: { _ in navigationStore.childSheetNode = nil }
        )) {
            if let sheetNode = navigationStore.childSheetNode {
                ViewFactory().getView(for: sheetNode)
            }
        }
        .environment(\.homescreenRouter, navigationStore)
        .environment(\.categoryRouter, navigationStore)
        .environment(\.articleDetailRouter, navigationStore)
        .environment(\.filterRouter, navigationStore)
    }
}
