//
//  FilterTagCollectionView.swift
//
//
//  Created by Jan Maloušek on 11.02.2024.
//

import SwiftUI

public struct FilterTagCollectionView: View {
    @Environment(\.filterTagCollectionRouter) private var router: FilterTagCollectionRouterLogic
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("FilterTagCollectionView")
                .font(.title)
            
            Spacer()
            
            Text("close")
                .onTapGesture {
                    router.navigate(.close)
                }
            Text("back")
                .onTapGesture {
                    router.navigate(.back)
                }
            
            Text("anotherFilterSheet")
                .onTapGesture {
                    router.navigate(.anotherFilterSheet)
                }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red)
    }
}
