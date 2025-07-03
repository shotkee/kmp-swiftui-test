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
	@Published var error: Swift.Error?
    
    
    func loadData() {
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
}
