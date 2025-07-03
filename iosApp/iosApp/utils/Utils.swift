
//
//  Utils.swift
//  iosApp
//
//  Created by vit on 03.07.2025.
//

import Shared
import Foundation

func convertKotlinDateToDate(_ time: Kotlinx_datetimeInstant?) -> Date? {
	if let timeInSeconds = time?.epochSeconds {
		return Date(timeIntervalSince1970: .init(timeInSeconds))
	}

	return nil
}
