//
//  BuyListScreenView.swift
//  iosApp
//
//  Created by vit on 02.07.2025.
//

import SwiftUI
import Shared

struct BuyListScreenView: View {
	@EnvironmentObject var testService: TestService
	
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 9) {
				ForEach(testService.insuranceProductCategoryList?.products ?? [], id:  \.self) { (category: InsuranceProductCategory) in
					ForEach(category.productList, id:  \.self) { (product: InsuranceProduct) in
						ProductCardView(product: product)
					}
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
	var product: InsuranceProduct?
    
    var body: some View {
        VStack {
            HStack (alignment: .bottom){
                VStack(alignment: .leading){
					Text(product?.title ?? "")
                        .foregroundColor(.textPrimary)
					
					Text(product?.text ?? "")
                        .foregroundColor(.textSecondary)
					
					ForEach(product?.tagList ?? [], id:  \.self) { (tag: InsuranceProductTag) in
						TagView(tag: tag)
					}
					
                    Spacer()
                }
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
                
                Spacer()
                
                AsyncImage(url: URL(
					string: product?.image ?? ""
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
	var tag: InsuranceProductTag?
    
    var body: some View {
		Text(tag?.title ?? "")
			.foregroundStyle(Color.from(hex: tag?.titleColor ?? "#000000") ?? Color.textPrimary)
            .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
			.background(Color.from(hex: tag?.backgroundColor ?? "#00FFFFFF") ?? Color.backgroundTertiary)
            .cornerRadius(4)
    }
}
