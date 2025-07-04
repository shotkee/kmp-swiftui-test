import SwiftUI
import shared

@main
struct iOSApp: App {
    init() {
		InitKoinKt.doInitKoinOnce()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
