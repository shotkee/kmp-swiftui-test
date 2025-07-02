//
//  InsurancesView.swift
//  iosApp
//
//  Created by vit on 02.07.2025.
//

import SwiftUI

struct InsurancesView: View {
    var body: some View {
        VStack(spacing: 12) {
            
            ForEach(0..<20) { index in
                Rectangle()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        Text("Элемент \(index + 1)")
                            .foregroundColor(.white)
                    )
                    .cornerRadius(8)
            }
        }
        .padding()
        .shadow(radius: <#T##CGFloat#>)
    }
}

#Preview {
    InsurancesView()
}
