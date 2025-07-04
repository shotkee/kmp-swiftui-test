//
//  StoriesView.swift
//  iosApp
//
//  Created by vit on 02.07.2025.
//

import SwiftUI
import shared

struct StoriesView: View {
	@EnvironmentObject var testService: TestService
	
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 9) {
				ForEach(testService.storyList?.stories ?? [], id:  \.self) { (story: Story) in
					StoryView(story: story)
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
	var story: Story?
    
    var body: some View {
		ZStack(alignment: .bottomLeading) {
			AsyncImage(url: URL(
				string: story?.previewUrlPath ?? ""
			)) { image in
				image.resizable()
			} placeholder: {
				Color.iconSecondary
			}
			.clipShape(
				RoundedRectangle(cornerRadius: 6)
			)
			.background(.clear)

			LinearGradient(
				gradient: Gradient(colors: [.imageOverlayStop, .imageOverlayStart]),
				startPoint: .top,
				endPoint: .bottom
			)
			.cornerRadius(6)
	
			Text(story?.title ?? "")
				.padding(10)
				.foregroundColor(Color.from(hex: String(story?.titleColor ?? 0xFFFFFF)))
				.font(Style.Font.normal(size: 13))
        }
        .padding(4)
        .frame(width: 102, height: 102)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.strokeAccent, lineWidth: 2)
        )
    }
}

