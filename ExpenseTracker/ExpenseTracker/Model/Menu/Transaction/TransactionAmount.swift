import SwiftUI

// Screen 1

struct TransactionAmount: View {
    let title: String = "Transaction Amount"
    let defaultAmount: String = "$ 100.00"
    @State var inputAmount: String = ""
    @State var amount: Double = 0
    @State var isEditing: Bool = false
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Rectangle()
                .frame(height: 20)
                .foregroundStyle(Color(.white))
                .padding(10)
            
            // Title
            Text(title)
                .frame(width: 400, alignment: .leading)
                .font(.system(size: 20))
                .foregroundStyle(.gray)
                .padding(.leading, 20)
            
            HStack(alignment: .center, spacing: 0) {
                // Amount
                TextField(defaultAmount, text: $inputAmount)
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.system(size: 46))
                    .foregroundStyle(.gray)
                    .padding(40)
            }
            
            // Expense & Income
            HStack(alignment: .center, spacing: 40){
                
                Button {
                    
                } label: {
                    Text("Expense")
                        .frame(width: 120, height: 60)
                        .background(Color(.gray))
                        .bold()
                        .clipShape(Capsule())
                        .font(.system(size: 18))
                        .foregroundStyle(.white)
                    
                }
                
                Button {
                    
                } label: {
                    Text("Income")
                        .frame(width: 120, height: 60)
                        .background(Color(.gray))
                        .bold()
                        .clipShape(Capsule())
                        .font(.system(size: 18))
                        .foregroundStyle(.white)
                }
                
            }
            Spacer()
            SaveButton()
        }
        .padding(0)
       
    }
}

struct SaveButton: View {
    var body: some View {
        Button {
        } label: {
            Text("Save")
                .frame(width: 400, height: 80)
                .background(Color(.gray))
                .bold()
                .clipShape(Capsule())
                .font(.system(size: 24))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    TransactionAmount()
}

