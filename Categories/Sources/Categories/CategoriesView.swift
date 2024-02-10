//
//  CategoriesView.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import SwiftUI

public struct CategoriesView: View {
    @Environment(\.categoryRouter) private var router: CategoriesRouterLogic
    @State private var counter = 1
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("CategoriesView")
                .font(.title)
            
            Spacer()
            
            Text("back")
                .onTapGesture {
                    router.navigate(.back)
                }
            
            Text("articleDetail")
                .onTapGesture {
                    router.navigate(.articleDetail(articleId: "123"))
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.yellow)
    }
}
