import SwiftUI
import Shared

struct ContentView: View {
    @State private var path = NavigationPath()
	
	@StateObject private var testService: TestService
	
	init() {
		// SwiftUI ensures that the following initialization uses the
		// closure only once during the lifetime of the view, so
		// later changes to the view's name input have no effect.
		_testService = StateObject(wrappedValue: TestService())
	}
    
	
    var body: some View {
        NavigationStack(path: $path) {
            MainScreenView(buyProduct: {
                path.append("buyProductsList")
            })
            .navigationDestination(
                for: String.self
            ) { value in
                switch value {
                    case "buyProductsList":
                        BuyListScreenView()
                    
                    default:
                        VStack{}
                    
                }
            }
        }
        .tint(.iconAccent)
		.onAppear {
			testService.loadStories()
			testService.loadInsurances()
		}
		.environmentObject(testService)
    }
}
