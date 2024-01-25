//
//  FilterTagCollectionView.swift
//
//
//  Created by Jan Maloušek on 25.01.2024.
//

import SwiftUI

public struct FilterTagCollectionView: View {
    @Environment(\.filterTagCollectionCoordinator) private var coordinator: FilterTagCollectionCoordinatorLogic
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("FilterTagCollectionView")
                .font(.title)
            
            Spacer()
            
            Text("close")
                .onTapGesture {
                    coordinator.navigate(.close)
                }
            Text("back")
                .onTapGesture {
                    coordinator.navigate(.back)
                }
            
            Text("toHome")
                .onTapGesture {
                    coordinator.navigate(.toHome)
                }
            
            Text("anotherFilterSheet")
                .onTapGesture {
                    coordinator.navigate(.anotherFilterSheet)
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.red)
    }
}
