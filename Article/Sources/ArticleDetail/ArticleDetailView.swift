//
//  ArticleDetailView.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import SwiftUI

public struct ArticleDetailView: View {
    @Environment(\.articleDetailCoordinator) private var coordinator: ArticleDetailCoordinatorLogic
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("ArticleView")
                .font(.title)
            
            Spacer()
            
            Text("back")
                .onTapGesture {
                    coordinator.navigate(.back)
                }
            
            Text("home")
                .onTapGesture {
                    coordinator.navigate(.home)
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray)
    }
}
