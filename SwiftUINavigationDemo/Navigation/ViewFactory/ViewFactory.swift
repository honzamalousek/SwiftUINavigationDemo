//
//  DestinationFactory.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Category
import Foundation
import Homescreen
import Filter
import SwiftUI

@MainActor
public struct ViewFactory {
    @ViewBuilder
    func getView(for node: AnyHashable) -> some View {
        switch node {
        case is CategoryNode:
            CategoryResolver().resolveView()
        case let node as ArticleDetailNode:
            ArticleDetailResolver().resolveView(articleNode: node)
        case is FilterNode:
            FilterResolver().resolveView()
        default:
            Text("Error: No Destination")
        }
    }
}
