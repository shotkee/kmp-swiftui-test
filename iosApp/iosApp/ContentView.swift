import SwiftUI
import Shared

struct ContentView: View {
    @State private var path = NavigationPath()
    
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
    }
}
