//
//  BuyListScreenView.swift
//  iosApp
//
//  Created by vit on 02.07.2025.
//

import SwiftUI

struct BuyListScreenView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 9) {
                ForEach(0..<10) { index in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .overlay(Text("\(index)").foregroundColor(.white))
                        .cornerRadius(16)
                }
            }
            .padding(.horizontal)
        }
        .background(Color(.backgroundContent))
        .navigationBarTitle("Купить полис")
        .toolbarRole(.editor)
    }
}
