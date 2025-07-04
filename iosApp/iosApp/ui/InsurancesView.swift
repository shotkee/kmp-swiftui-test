//
//  InsurancesView.swift
//  iosApp
//
//  Created by vit on 02.07.2025.
//

import SwiftUI
import shared

struct InsurancesView: View {
	@EnvironmentObject var testService: TestService
	
    var buyButtonTap: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack {
                    Text("Полисы")
						.font(Style.Font.demiBold(size: 24))
                    
                    Spacer()
                    
                    Button(action: {
                        buyButtonTap?()
                    }) {
                       Text("Купить")
							.padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
							.font(Style.Font.normal(size: 15))
                    }
                    .foregroundColor(Color(.textContrast))
                    .background(Color(.backgroundAccent))
                    .clipShape(Capsule())
                }
                
                Spacer(minLength: 20)
                
                VStack(spacing: 2) {
					ForEach(testService.insuranceMain?.insuranceGroupList ?? [], id:  \.self) { (group: InsuranceGroup) in
						SectionView(insuranceGroup: group)
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
    @State var contentIsHidden = false
	
	var insuranceGroup: InsuranceGroup?
    
    var body: some View {
        VStack {
            SectionHeaderView(
				contentIsHidden: contentIsHidden,
				insuranceGroup: insuranceGroup,
                toggleCollapse: {
                    contentIsHidden = !contentIsHidden
                }
            )
            
            if !contentIsHidden {
				SectionContentView(
					categoryList: insuranceGroup?.insuranceGroupCategoryList
				)
            }
        }
		.background(.backgroundContent)
    }
}

struct SectionHeaderView: View {
	@State var contentIsHidden = false
	var insuranceGroup: InsuranceGroup?
    
    var toggleCollapse: (() -> Void)?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
				Text(insuranceGroup?.objectType ?? "")
					.font(Style.Font.normal(size: 11))
				Text(insuranceGroup?.objectName ?? "")
					.font(Style.Font.demiBold(size: 16))
            }
            
            Spacer()
            
            Button(action: {
                toggleCollapse?()
				
				self.contentIsHidden = !contentIsHidden
            }) {
				if contentIsHidden {
					Image(.divkitDown)
						.frame(width: 24, height: 24)
				} else {
					Image(.divkitUp)
						.frame(width: 24, height: 24)
						.tint(.iconPrimary)
				}
            }
            .frame(width: 32, height: 32)
        }
        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
    }
}

struct SectionContentView: View {
	var categoryList: [InsuranceGroupCategory]?
    
    var body: some View {
		VStack {
			ForEach(categoryList ?? [], id: \.self) { (category: InsuranceGroupCategory) in
				Text(category.insuranceCategory.title)
					.font(Style.Font.normal(size: 11))
				
				ListView(insuranceList: category.insuranceList)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
        }
		.background(.gray)
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
    }
}

struct ListView: View {
	var insuranceList: [InsuranceShort]?
	
	var body: some View {
		VStack {
			ForEach(insuranceList ?? [], id: \.self) { (insurance: InsuranceShort) in
				Text(insurance.title)
					.font(Style.Font.normal(size: 18))
				
				let date: Kotlinx_datetimeInstant? = insurance.startDate
				let dateString = dateFormatter.string(from: convertKotlinDateToDate(date) ?? Date())
				
				Text("Действителен по " + dateString)
					.font(Style.Font.normal(size: 11))
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
}

private let dateFormatter: DateFormatter = {
	let dateFormatter = DateFormatter()
	dateFormatter.dateFormat = "dd.MM.yyyy"
	return dateFormatter
}()
