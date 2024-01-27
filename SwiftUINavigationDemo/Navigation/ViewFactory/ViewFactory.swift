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

@MainActor
public struct ViewFactory {
    @ViewBuilder
    func getView(for node: AnyHashable) -> some View {
        switch node as? any Node {
        case is HomescreenNode:
            HomescreenResolver().resolveView()
        case is CategoryNode:
            CategoryResolver().resolveView(id: "")
        case let node as ArticleDetailNode:
            ArticleDetailResolver().resolveView(articleNode: node)
        case is FilterNode:
            FilterResolver().resolveView()
        case is FilterTagCollectionNode:
            FilterTagCollectionResolver().resolveView()
        default:
            Text("Error: No Destination")
        }
    }
}
