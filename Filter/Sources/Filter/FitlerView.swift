//
//  SwiftUIView.swift
//
//
//  Created by Jan Maloušek on 25.01.2024.
//

import SwiftUI

public struct FilterView: View {
    @Environment(\.filterRouter) private var router: FilterRouterLogic
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("Filter")
                .font(.title)
            
            Spacer()
            
            Text("close")
                .onTapGesture {
                    router.navigate(.close)
                }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.yellow)
    }
}
