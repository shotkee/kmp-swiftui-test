//
//  MainScreenView.swift
//  iosApp
//
//  Created by vit on 02.07.2025.
//

import SwiftUI

struct MainScreenView: View {    
    var body: some View {
        //NavigationView {
            ScrollView {
                VStack(spacing: 14) {
                    StoriesView()
                    InsurancesView()
                }
            }
            .background(Color(.systemBackground))
        //}
    }
}


