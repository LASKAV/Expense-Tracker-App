import SwiftUI

// Screen 1

struct TransactionAmount: View {
    let title: String = "Transaction Amount"
    let defaultAmount: String = "$ 0"
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
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.system(size: 46))
                    .foregroundStyle(.gray)
                    .padding(40)
                    .onChange(of: inputAmount) { newValue in
                        amount = Double(newValue) ?? 0
                        if amount >= 1 {
                            self.isEditing = true
                            print("isEditing = \(isEditing)")
                            print("amount = \(amount)")
                        } else {
                            self.isEditing = false
                        }
                    }
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
            SaveButton(isEditing: $isEditing)
        }
        .padding(0)
    }
}

struct SaveButton: View {
    
    @Binding var isEditing: Bool
    @State private var navigateToNextScreen = false
    
    var body: some View {
        
        Button {
            
            if isEditing {
                
                navigateToNextScreen = true
                print("next screen")
                
            } else {
                
                print("Error: isEditing is not true")
                
            }
        } label: {
            Text("Save")
                .frame(width: 350, height: 70)
                .background(Color(.gray))
                .bold()
                .clipShape(Capsule())
                .font(.system(size: 24))
                .foregroundStyle(.white)
            
        }
        .padding(20)
        
        NavigationLink(destination: TransactionDate(), isActive: $navigateToNextScreen) {
            EmptyView()
        }
    }
}


#Preview {
    TransactionAmount()
}

