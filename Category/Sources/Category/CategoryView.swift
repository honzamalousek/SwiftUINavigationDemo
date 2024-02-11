//
//  CategoryView.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import SwiftUI

public struct CategoryView: View {
    @Environment(\.categoryRouter) private var router: CategoryRouterLogic
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("CategoryView")
                .font(.title)
            
            Spacer()
            
            Text("back")
                .onTapGesture {
                    router.navigate(.back)
                }
            
            Text("articleDetail")
                .onTapGesture {
                    // navigate to articleDetail with passed parameter
                    router.navigate(.articleDetail(articleId: "123"))
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.yellow)
    }
}
