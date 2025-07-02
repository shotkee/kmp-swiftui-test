//
//  InsurancesView.swift
//  iosApp
//
//  Created by vit on 02.07.2025.
//

import SwiftUI

struct InsurancesView: View {
    var buyButtonTap: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack {
                    Text("Полисы")
                    
                    Spacer()
                    
                    Button(action: {
                        buyButtonTap?()
                    }) {
                       Text("Купить")
                            .padding(.horizontal, 10)
                    }
                    .frame(height: 36)
                    .foregroundColor(Color(.textContrast))
                    .background(Color(.backgroundAccent))
                    .clipShape(Capsule())
                }
                
                Spacer(minLength: 20)
                
                VStack(spacing: 2) {
                    ForEach(0..<20) { index in
                        SectionView(index: index)
                    }
                }
                .background(Color.clear)
                .clipped()
                .cornerRadius(16)
                .shadow(color: Color(.shadow100), radius: 16, x: 0, y: 2)
            }
            .padding(15)
        }
        .background(Color(.backgroundContent))
        .clipped()
        .cornerRadius(16)
        .shadow(color: Color(.shadow100), radius: 16, x: 0, y: 2)
    }
}

#Preview {
    InsurancesView()
}

struct SectionView: View {
    @State var index = 0
    @State var contentIsHidden = false
    
    var body: some View {
        VStack {
            SectionHeaderView(
                index: index,
                toggleCollapse: {
                    contentIsHidden = !contentIsHidden
                }
            )
            
            if !contentIsHidden {
                SectionContentView(index: index)
            }
        }
        .background(Color.white)
    }
}

struct SectionHeaderView: View {
    @State var index = 0
    
    var toggleCollapse: (() -> Void)?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Элемент \(index)")
                Text("Второй заголовок \(index)")
            }
            
            Spacer()
            
            Button(action: {
                print("collapse \(index + 1)")
                toggleCollapse?()
            }) {
               Text("1")
            }
            .frame(width: 32, height: 32)
            .background(Color.green)
        }
        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
    }
}

struct SectionContentView: View {
    @State var index = 0
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.gray)
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .overlay(
                    Text("Content \(index + 1)")
                )
        }
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
    }
}
