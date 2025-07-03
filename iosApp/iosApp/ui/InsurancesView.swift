//
//  InsurancesView.swift
//  iosApp
//
//  Created by vit on 02.07.2025.
//

import SwiftUI
import Shared

struct InsurancesView: View {
	@EnvironmentObject var testService: TestService
	
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
	@State var insuranceGroup: InsuranceGroup?
    
    var toggleCollapse: (() -> Void)?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
				Text(insuranceGroup?.objectType ?? "")
				Text(insuranceGroup?.objectName ?? "")
            }
            
            Spacer()
            
            Button(action: {
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
	var categoryList: [InsuranceGroupCategory]?
    
    var body: some View {
		VStack {
			ForEach(categoryList ?? [], id: \.self) { (category: InsuranceGroupCategory) in
				Text(category.insuranceCategory.title)
				
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
				
				let date: Kotlinx_datetimeInstant? = insurance.startDate
				let dateString = dateFormatter.string(from: convertKotlinDateToDate(date) ?? Date())
				
				Text("Действителен по " + dateString)
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
