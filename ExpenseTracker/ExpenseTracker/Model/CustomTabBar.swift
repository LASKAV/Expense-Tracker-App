import SwiftUI

struct CustomTabBar: View {
    
    @State private var activeTab: TabModel = .home
    
    var body: some View {
        TabView(selection: $activeTab) {
            
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            
            Text("Alerts")
                .tabItem {
                    Label("Charts", systemImage: "cellularbars")
                }
            
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        CustomTabBar()
            .environmentObject(transactionListVM)
    }
}
