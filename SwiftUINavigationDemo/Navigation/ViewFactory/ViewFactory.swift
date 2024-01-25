//
//  DestinationFactory.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Categories
import Foundation
import Homescreen
import SwiftUI
import Common

public struct ViewFactory {
    @ViewBuilder
    func getView(for node: Node) -> some View {
        switch node {
        case is HomescreenNode:
            HomescreenResolver().resolveView()
        case is CategoryNode:
            CategoryResolver().resolveView(id: "")
        case let node as ArticleDetailNode:
            ArticleDetailResolver().resolveView(articleId: node.articleId)
        case is FilterNode:
            FilterResolver().resolveView()
        case is FilterTagCollectionNode:
            FilterTagCollectionResolver().resolveView()
        default:
            Text("Error: No Destination")
        }
    }
    
    @ViewBuilder
    func getSheet(
        for sheetRoot: Node,
        parentNavigationStore: NavigationStore
    ) -> some View {
        NavRootView(
            navigationStore: NavigationStore(
                rootNode: sheetRoot,
                parentNavigationStore: parentNavigationStore
            )
        )
    }
}
