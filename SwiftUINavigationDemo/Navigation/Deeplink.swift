//
//  Deeplink.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 26.01.2024.
//

import Common
import Foundation

class PrefillArticlesGiftVoucherDeeplink: Deeplink {
    let voucherCode: String

    init(voucherCode: String, handlerNode: Node) {
        self.voucherCode = voucherCode
        super.init(handlerNode: handlerNode)
    }
}

