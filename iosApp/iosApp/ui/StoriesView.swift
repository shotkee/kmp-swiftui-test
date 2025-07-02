//
//  StoriesView.swift
//  iosApp
//
//  Created by vit on 02.07.2025.
//

import SwiftUI

struct StoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 9) {
                ForEach(0..<10) { index in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .overlay(Text("\(index)").foregroundColor(.white))
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    StoriesView()
}
