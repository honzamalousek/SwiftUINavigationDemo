//
//  HomescreenView.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import SwiftUI

public struct HomescreenView: View {
    @Environment(\.homescreenCoordinator) private var coordinator: HomescreenCoordinatorLogic
    
    public init() {
    }
    
    public var body: some View {
        VStack{
            Text("Homescreen")
                .font(.title)
            
            Spacer()
            
            Text("categories")
                .onTapGesture {
                    coordinator.navigate(.categories)
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.green)
    }
}
