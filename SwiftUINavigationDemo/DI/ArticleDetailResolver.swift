//
//  ArticleDetailResolver.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Categories
import Foundation
import SwiftUI
import Article

struct ArticleDetailResolver {
    func resolveView(articleId: String) -> some View {
        ArticleDetailView()
    }
}
