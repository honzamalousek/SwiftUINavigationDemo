//
//  HomescreenView.swift
//
//
//  Created by Jan Maloušek on 24.01.2024.
//

import SwiftUI

public struct HomescreenView: View {
    @Environment(\.homescreenRouter) private var router: HomescreenRouterLogic
    
    public init() {
    }
    
    public var body: some View {
        VStack{
            Text("Homescreen")
                .font(.title)
            
            Spacer()
            
            Text("categories")
                .onTapGesture {
                    router.navigate(.categories)
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.green)
    }
}
