//
//  ArticleDetailView.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import SwiftUI

public struct ArticleDetailView: View {
    @Environment(\.articleDetailRouter) private var router: ArticleDetailRouterLogic
    @EnvironmentObject private var viewModel: ArticleDetailVM
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("ArticleView id: \(viewModel.articleId)")
                .font(.title)
            
            Spacer()
            
            Spacer()
                .frame(height: 100)
            
            Text("back")
                .onTapGesture {
                    router.navigate(.back)
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
}
