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
                    StoryView()
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    StoriesView()
}

struct StoryView: View {
    @State var title = ""
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(
                string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg"
            )) { image in
                image.resizable()
            } placeholder: {
                Color.iconSecondary
            }
            .clipShape(
                RoundedRectangle(cornerRadius: 6)
            )
            .background(.clear)
            
            //Text("\(title)").foregroundColor(.white)
        }
        .padding(4)
        .frame(width: 102, height: 102)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.strokeAccent, lineWidth: 2)
        )
    }
}

