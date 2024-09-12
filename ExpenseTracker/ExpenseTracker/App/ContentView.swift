import SwiftUI
import SwiftUICharts
import Charts

struct ContentView: View {
    @State private var activeTab: TabModel = .home
    
    var body: some View {
        TabView(selection: $activeTab) {
            
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            
            ChartsScreen()
                .tabItem {
                    Label("Charts", systemImage: "cellularbars")
                }
            
            
            SettingsScreen()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        ContentView()
            .environmentObject(transactionListVM)
    }
}
