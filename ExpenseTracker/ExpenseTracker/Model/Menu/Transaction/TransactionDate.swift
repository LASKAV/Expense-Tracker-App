import SwiftUI

struct TransactionDate: View {
    
    let title: String = "Transaction Date"
    @State private var date = Date()
    @State var isEditing: Bool = false
    
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
           
            .onChange(of: date) { newValue in            saveDate(newValue)
                isEditing = true 
            }
            SaveButtonDate(isEditing: $isEditing)
        }
        .padding(0)
    }
}


func formattedDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .long // 5  okt 2024
    return formatter.string(from: date)
}

func saveDate(_ date: Date) {
    print("Date is saved: \(formattedDate(date: date))")
}


struct SaveButtonDate: View {
    
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
        
        NavigationLink(destination: HomeScreen(), isActive: $navigateToNextScreen) {
            EmptyView()
        }
    }
}

#Preview {
    TransactionDate()
}
