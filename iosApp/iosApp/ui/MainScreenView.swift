//
//  MainScreenView.swift
//  iosApp
//
//  Created by vit on 02.07.2025.
//

import SwiftUI
import Shared

struct MainScreenView: View {	
    var buyProduct: (() -> Void)?
    
    //@StateObject private var testViewModel = TestViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                StoriesView()
                InsurancesView(buyButtonTap: buyProduct)
            }
        }
        .background(Color(.systemBackground))
    }
}


