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
                    ProductCardView(index: index)
                }
            }
            .padding(.horizontal)
        }
        .background(Color(.backgroundContent))
        .navigationBarTitle("Купить полис")
        .toolbarRole(.editor)
    }
}

struct ProductCardView: View {
    @State var index = 0
    
    var body: some View {
        VStack {
            HStack (alignment: .bottom){
                VStack(alignment: .leading){
                    Text("\(index)")
                        .foregroundColor(.textPrimary)
                    Text("some description text")
                        .foregroundColor(.textSecondary)
                    TagView(text: "dwjidja")
                    TagView(text: "123")
                    TagView(text: "dwjidjadwadiwajidjawij")
                    TagView(text: "da")
                    TagView(text: "dwdawjidja")
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
                
                Spacer()
                
                AsyncImage(url: URL(
                    string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg"
                )) { image in
                    image.resizable()
                } placeholder: {
                    Color.iconSecondary
                }
                .frame(width: 126, height: 126)
            }
        }
        .background(.backgroundContent)
        .clipped()
        .cornerRadius(16)
        .shadow(color: .shadow100, radius: 16, x: 0, y: 2)
        .frame(maxWidth: .infinity)
    }
}

struct TagView: View {
    @State var text = ""
    
    var body: some View {
        Text(text)
            .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
            .background(.backgroundTertiary)
            .cornerRadius(4)
    }
}
