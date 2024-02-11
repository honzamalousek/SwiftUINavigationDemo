//
//  ArticleDetailResolver.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Article
import Category
import Foundation
import SwiftUI

@MainActor
struct ArticleDetailResolver {
    func resolveView(articleNode: ArticleDetailNode) -> some View {
        let articleView = ArticleDetailView()
        let viewModel = ArticleDetailVM(articleId: articleNode.articleId)
        
        return articleView
            .environmentObject(viewModel)
    }
}
