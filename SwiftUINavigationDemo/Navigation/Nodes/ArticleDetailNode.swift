//
//  ArticleDetailNode.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Foundation
import SwiftUI

struct ArticleDetailNode: Hashable {
    let articleId: String
    
    init(
        articleId: String
    ) {
        self.articleId = articleId
    }
}
