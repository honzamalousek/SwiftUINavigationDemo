//
//  NavRootView.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Article
import Categories
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
                .navigationDestination(for: AnyHashable.self) { destination in
                    ViewFactory().getView(for: destination)
                }
        }
        .environment(\.homescreenRouter, navigationStore)
        .environment(\.categoryRouter, navigationStore)
        .environment(\.articleDetailRouter, navigationStore)
    }
}
