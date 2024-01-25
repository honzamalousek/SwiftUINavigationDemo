//
//  SwiftUIView.swift
//
//
//  Created by Jan Maloušek on 25.01.2024.
//

import SwiftUI

public struct FilterView: View {
    @Environment(\.filterCoordinator) private var coordinator: FilterCoordinatorLogic
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("Filter")
                .font(.title)
            
            Spacer()
            
            Text("close")
                .onTapGesture {
                    coordinator.navigate(.close)
                }
            
            Text("toFilterTagCollection")
                .onTapGesture {
                    coordinator.navigate(.toFilterTagCollection)
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.yellow)
    }
}
