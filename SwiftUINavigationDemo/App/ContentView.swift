//
//  ContentView.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Common
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavRootView(
            navigationStore: NavigationStore(
                rootNode: HomescreenNode(),
                parentNavigationStore: nil
            )
        )
    }
}

#Preview {
    ContentView()
}
