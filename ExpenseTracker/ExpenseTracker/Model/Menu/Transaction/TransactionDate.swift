import SwiftUI

struct TransactionDate: View {
    
    let title: String = "Transaction Date"
    @State private var date = Date()
    
    var body: some View {
        
        
        VStack(spacing: 0) {
            
            Rectangle()
                .frame(height: 20)
                .foregroundStyle(Color(.white))
                .padding(10)
            
            Text(title)
                .frame(width: 400, alignment: .leading)
                .font(.system(size: 20))
                .foregroundStyle(.gray)
                .padding([.leading, .vertical], 20)
            
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            
            Spacer()
            
            SaveButton()
        }
        .padding(0)
    }
}

#Preview {
    TransactionDate()
}
