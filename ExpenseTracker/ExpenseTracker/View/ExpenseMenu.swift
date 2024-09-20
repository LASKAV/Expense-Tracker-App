import SwiftUI

struct ExpenseMenu: View {
    
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading, spacing: 24) {
                
                // MARK: Title
                Text("Expense")
                    .font(.title2)
                    .bold()
                
                
            } // -> VStack
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
        } // -> scroll
        .background(Color.customBackground)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ExpenseMenu()
}
