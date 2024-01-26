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

class ArticleDetailNode: Node {
    let articleId: String
    let deeplinkHandlerFunction = CurrentValueSubject<((String) -> Void)?, Never>(nil)
    var deeplinkHandlerFunctionCancellable: AnyCancellable?
    
    init(articleId: String) {
        self.articleId = articleId
        super.init()
    }
    
    override func handleDeeplink(deeplink: Any, navigationStore: NavigationStore) {
        guard let deeplink = deeplink as? PrefillArticlesGiftVoucherDeeplink else { return }
        deeplinkHandlerFunctionCancellable = deeplinkHandlerFunction
            .filter{ $0 != nil }
            .timeout(1, scheduler: DispatchQueue.main)
            .receive(on: DispatchQueue.main)
            .sink{ deeplinkHandlerFunction in
                guard let deeplinkHandlerFunction else { return }
                deeplinkHandlerFunction(deeplink.voucherCode)
            }
    }
}
