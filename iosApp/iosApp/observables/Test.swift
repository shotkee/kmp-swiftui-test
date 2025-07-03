//
//  Test.swift
//  iosApp
//
//  Created by vit on 02.07.2025.
//

import Foundation
import SwiftUI
@preconcurrency import Shared


class TestService: ObservableObject {
	private let apiService: ApiService = InitKoinKt.getApiService()

	@Published var insuranceMain: InsuranceMain?
	@Published var storyList: StoryList?
	@Published var insuranceProductCategoryList: InsuranceProductCategoryList?
	
	@Published var error: Swift.Error?
    
    func loadInsurances() {
        Task {
            do {
                let result = try await apiService.insurances()
				
				if let success = result as? ResultSuccess<InsuranceMain> {
					DispatchQueue.main.async { [weak self] in
						self?.insuranceMain = success.data
					}
				}
				
				if let failure = result as? ResultError<NetworkError> {
					DispatchQueue.main.async { [weak self] in
						self?.error = NSError(domain: failure.error.name, code: 0, userInfo: [NSLocalizedDescriptionKey: failure.error.debugDescription])
					}
			
				}
				
            } catch {
                DispatchQueue.main.async {
					self.error = NSError(domain: "", code: 0, userInfo: [ NSLocalizedDescriptionKey: error.localizedDescription])
                }
            }
        }
    }
	
	func loadStories() {
		Task {
			do {
				let result = try await apiService.stories()
				
				if let success = result as? ResultSuccess<StoryList> {
					DispatchQueue.main.async { [weak self] in
						self?.storyList = success.data
					}
				}
				
				if let failure = result as? ResultError<NetworkError> {
					DispatchQueue.main.async { [weak self] in
						self?.error = NSError(domain: failure.error.name, code: 0, userInfo: [NSLocalizedDescriptionKey: failure.error.debugDescription])
					}
			
				}
				
			} catch {
				DispatchQueue.main.async {
					self.error = NSError(domain: "", code: 0, userInfo: [ NSLocalizedDescriptionKey: error.localizedDescription])
				}
			}
		}
	}
	
	func loadProducts() {
		Task {
			do {
				let result = try await apiService.products()
				
				if let success = result as? ResultSuccess<InsuranceProductCategoryList> {
					DispatchQueue.main.async { [weak self] in
						self?.insuranceProductCategoryList = success.data
					}
				}
				
				if let failure = result as? ResultError<NetworkError> {
					DispatchQueue.main.async { [weak self] in
						self?.error = NSError(domain: failure.error.name, code: 0, userInfo: [NSLocalizedDescriptionKey: failure.error.debugDescription])
					}
			
				}
				
			} catch {
				DispatchQueue.main.async {
					self.error = NSError(domain: "", code: 0, userInfo: [ NSLocalizedDescriptionKey: error.localizedDescription])
				}
			}
		}
	}
}
