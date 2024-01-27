//
//  DestinationFactory.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Categories
import Common
import Foundation
import Homescreen
import SwiftUI

@MainActor
public struct ViewFactory {
    @ViewBuilder
    func getView(for node: any Node) -> some View {
        switch node {
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
    
    @ViewBuilder
    func getView(for node: AnyHashable) -> some View {
        if let node = node as? any Node {
            getView(for: node)
        } else {
            Text("Error: Not conforming to node")
        }
    }
}
