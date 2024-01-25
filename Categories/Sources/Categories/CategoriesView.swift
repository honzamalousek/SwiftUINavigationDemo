//
//  CategoriesView.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import SwiftUI

public struct CategoriesView: View {
    @Environment(\.categoryCoordinator) private var coordinator: CategoriesCoordinatorLogic
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("CategoriesView")
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
            
            Text("articleDetail")
                .onTapGesture {
                    coordinator.navigate(.articleDetail(articleId: "123"))
                }
            
            Text("filter")
                .onTapGesture {
                    coordinator.navigate(.filter)
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.blue)
    }
}
