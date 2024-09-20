import SwiftUI
import SwiftUICharts
import Charts

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    HStack(spacing: 0) {
                        
                        // MARK: Title
                        Text("Home")
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                        
                        NavigationButtonPlusExpense()
                    }
                    ChartMaineContentView()
                    
                    // MARK: Treansaction List
                    RecentTransactionList()
                }
                .frame(maxWidth: .infinity)
                .padding()
                
            }
            .background(Color.customBackground)
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack) // iOS new version
        .accentColor(.primary)
    }
}

struct NavigationButtonPlusExpense: View {
    
    var body: some View {
        NavigationLink(destination: ExpenseMenu()) {
            Image.plus
                .resizable()
                .frame(width: 40, height: 40)
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color.customIcon,.primary)
                .foregroundStyle(Color.white)
        }
    }
}

// MARK: ChartMaineContentView for screen
struct ChartMaineContentView: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
         
        // MARK: Chart
        let data = transactionListVM.accumulateTransactions()
        
        
        if !data.isEmpty {
            let totalExpenses = data.last?.1 ?? 0
            
            CardView {
                VStack(alignment: .leading) {
                    ChartLabel(totalExpenses.formatted(.currency(code: "USD")),
                               type: .title, format: "$%.02f")
                    LineChart()
                }
                .background(Color.systemBackground)
            }
            .data(data)
            .chartStyle(ChartStyle(
                backgroundColor: Color.systemBackground,
                foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
            .frame(height: 280)
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        HomeScreen()
            .environmentObject(transactionListVM)
    }
}
