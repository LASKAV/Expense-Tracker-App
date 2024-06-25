import SwiftUI

struct TransactionRow: View {
    var transaction: Transaction
    
    
    var body: some View {
        HStack(spacing: 20){
            VStack(alignment: .leading, spacing: 6 ) {
                // MARK: Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // MARK: Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // MARK: Transaction Date
                Text(Date(), format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .padding([.top,.bottom], 8)
    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}
