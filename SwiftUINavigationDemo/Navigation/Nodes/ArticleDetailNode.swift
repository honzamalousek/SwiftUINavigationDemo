//
//  ArticleDetailNode.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Common
import Foundation
import SwiftUI
import Combine

struct ArticleDetailNode: Node {
    let articleId: String
    let prefilledVoucher: String
    
    init(
        articleId: String,
        prefilledVoucher: String = ""
    ) {
        self.articleId = articleId
        self.prefilledVoucher = prefilledVoucher
    }
    
    func handleDeeplink(
        deeplink: Any,
        navigationStore: NavigationStore
    ) -> Bool {
        return false
    }
}
