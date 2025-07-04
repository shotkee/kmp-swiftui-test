//
//  Style.swift
//  iosApp
//
//  Created by vit on 04.07.2025.
//

import SwiftUI

enum Style {
	enum Font {
		static func regular(size: CGFloat) -> SwiftUI.Font {
			return SwiftUI.Font.custom("TTNormsPro-Rg", size: size)
		}
	
		static func medium(size: CGFloat) -> SwiftUI.Font {
			return SwiftUI.Font.custom("TTNormsPro-Md", size: size)
		}
	
		static func normal(size: CGFloat) -> SwiftUI.Font {
			return SwiftUI.Font.custom("TTNormsPro-Normal", size: size)
		}
	
		static func demiBold(size: CGFloat) -> SwiftUI.Font {
			return SwiftUI.Font.custom("TTNormsPro-DmBd", size: size)
		}
	
		static func italic(size: CGFloat) -> SwiftUI.Font {
			return SwiftUI.Font.custom("TTNormsPro-Italic", size: size)
		}
	}
}
