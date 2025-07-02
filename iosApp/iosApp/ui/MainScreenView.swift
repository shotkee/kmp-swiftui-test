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
                VStack {
                    StoriesView()
                    Spacer().frame(height: 16)
                    InsurancesView()
                }
            }
            .background(Color.green)
        //}
    }
}


