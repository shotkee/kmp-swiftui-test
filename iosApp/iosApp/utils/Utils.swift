
//
//  Utils.swift
//  iosApp
//
//  Created by vit on 03.07.2025.
//

import shared
import Foundation
import SwiftUI

func convertKotlinDateToDate(_ time: Kotlinx_datetimeInstant?) -> Date? {
	if let timeInSeconds = time?.epochSeconds {
		return Date(timeIntervalSince1970: .init(timeInSeconds))
	}
	
	return nil
}

extension Color {
	static func from(hex: String) -> Color? {
		guard !hex.isEmpty else { return nil }
		
		var string = hex.uppercased()
		if string[string.startIndex] == "#" {
			string.remove(at: string.startIndex)
		}
		
		guard hex.count >= 3 else { return nil }
		guard let rgb = UInt32(string, radix: 16) else { return nil }
		
		let alpha, red, green, blue: UInt32
		switch string.count {
			case 3: // RGB (12-bit) "RGB"
				(alpha, red, green, blue) = (255, (rgb >> 8 & 0xF) * 17, (rgb >> 4 & 0xF) * 17, (rgb & 0xF) * 17)
			case 4: // ARGB (16-bit) "ARGB"
				(alpha, red, green, blue) = ((rgb >> 12 & 0xF) * 17, (rgb >> 8 & 0xF) * 17, (rgb >> 4 & 0xF) * 17, (rgb & 0xF) * 17)
			case 6: // RGB (24-bit) "RRGGBB"
				(alpha, red, green, blue) = (255, rgb >> 16, rgb >> 8 & 0xFF, rgb & 0xFF)
			case 8: // ARGB (32-bit) "AARRGGBB"
				(alpha, red, green, blue) = (rgb >> 24, rgb >> 16 & 0xFF, rgb >> 8 & 0xFF, rgb & 0xFF)
			default:
				return nil
		}
		
		return Color(uiColor:
			.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: CGFloat(alpha) / 255)
		)
		
	}
}
