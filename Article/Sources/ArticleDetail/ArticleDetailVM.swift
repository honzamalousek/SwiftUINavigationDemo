//
//  ArticleDeatilVM.swift
//
//
//  Created by Jan Maloušek on 26.01.2024.
//

import Foundation

@MainActor
public final class ArticleDetailVM: ObservableObject {
    // MARK: - Instance properties
    
    // MARK: - Observed properties
    
    @Published public var articleId: String = ""
    
    // MARK: - Lifecycle
    
    public init(
        articleId: String = ""
    ) {
        self.articleId = articleId
    }
}
