//
//  ContentView.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Common
import SwiftUI

struct ContentView: View {
    let rootNavigationStore = NavigationStore(
        rootNode: HomescreenNode(),
        parentNavigationStore: nil
    )

    var body: some View {
        ZStack {
            NavRootView(navigationStore: rootNavigationStore)

            deeplinkFAB
        }
    }

    var deeplinkFAB: some View {
        Circle()
            .fill(.black)
            .overlay(
                Text("deeplink")
                    .foregroundColor(.white)
            )
            .frame(width: 80, height: 80)
            .padding()
            .onTapGesture {
                Task{ @MainActor in
                    try await Task.sleep(nanoseconds: 5000000000)
                    
                    rootNavigationStore.handleDeeplink(
                        deeplink: PrefillArticlesGiftVoucherDeeplink(
                            voucherCode: "123456789",
                            handlerNode: ArticleDetailNode(articleId: "string")
                        )
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }
}

#Preview {
    ContentView()
}
