//
//  ArticleDetailNode.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Foundation
import Common

class ArticleDetailNode: Node {
    let articleId: String
    
    init(articleId: String) {
        self.articleId = articleId
        super.init()
    }
}
