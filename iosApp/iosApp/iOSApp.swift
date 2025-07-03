import SwiftUI
import Shared

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
