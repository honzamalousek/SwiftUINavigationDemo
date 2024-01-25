//
//  CategoryResolver.swift
//  SwiftUINavigationDemo
//
//  Created by Jan Maloušek on 24.01.2024.
//

import Categories
import Foundation
import SwiftUI

struct CategoryResolver {
    func resolveView(id: String) -> some View {
        CategoriesView()
    }
}
