import SwiftUI

@main
struct ExpenseTrackerApp: App {
    
    @StateObject var transactionListVM = TransactionListViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
