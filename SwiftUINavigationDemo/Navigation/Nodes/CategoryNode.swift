//
//  CategoryNode.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 25.01.2024.
//

import Common
import Foundation

struct CategoryNode: Node {
    func handleDeeplink(deeplink: Any, navigationStore: NavigationStore) -> Bool {
        guard let deeplink = deeplink as? Deeplink else { return false }
        switch deeplink {
        case let .prefilledArticleDetail(articleId, _):
            handlePrefilledArticleDetailDeeplink(
                deeplink: deeplink,
                navigationStore: navigationStore
            )
            return true
        }
    }
}

extension CategoryNode {
    func handlePrefilledArticleDetailDeeplink(
        deeplink: Deeplink,
        navigationStore: NavigationStore
    ) {
        guard case let .prefilledArticleDetail(articleId, voucher) = deeplink else { return }

        let articleNode = ArticleDetailNode(
            articleId: articleId,
            prefilledVoucher: voucher
        )
        navigationStore.navigationPath.append(articleNode)
        _ = articleNode.handleDeeplink(deeplink: deeplink, navigationStore: navigationStore)
    }
}
