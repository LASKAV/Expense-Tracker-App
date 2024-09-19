
import SwiftUI

struct ExpenseMenu: View {
    
    @State private var textInput = ""
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: 0) {
                
                Text("Title")
                    .font(.title2)
                    .foregroundStyle(Color.customIcon,.primary)
                
                    .bold()
                
                Spacer()
                
                ButtonReturn().buttonStyle(WhiteButtonStyle())
                    .frame(alignment: .topTrailing)
                
            }
            .padding(.top, 10)
            .padding([.trailing , .leading], 20)
            
            Divider()
                .frame(height: 1)
                .overlay(.gray)
                .padding(10)

            
            HStack(alignment: .center, spacing: 0) {
                
                
                
                ButtonIncome().buttonStyle(EpenseButtonStyle())
//                    .border(.red)
                
                Spacer()
                
                ButtonExpense().buttonStyle(EpenseButtonStyle())
//                    .border(.red)
                
            }
            
            .padding([.trailing , .leading], 20)
            
            // MARK: Input data
            VStack() {
                
                // MARK: Date
                HStack(spacing: 6) {
                    Text("Date")
                 
                    Spacer()
                    TextField("",text: $textInput)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200, height: 10)
                        .padding()
                
                }
                
                // MARK: Amount
                HStack(spacing: 6) {
                    Text("Amount")

                    Spacer()
                    TextField("",text: $textInput)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200, height: 10)
                        .padding()
    
                }
                
                // MARK: Category
                HStack(spacing: 6) {
                    Text("Category")
       
                    Spacer()
                    TextField("",text: $textInput)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200, height: 10)
                        .padding()
             
                }
            }
            .padding()
            
            Divider()
                .frame(height: 1)
                .overlay(.gray)
                .padding(10)
            
            
        } // ;
        .aspectRatio(CGSize(width: 276, height: 567), contentMode: .fit)
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
        //        .border(.red)
        .padding(40)
        
    }
}

struct ButtonIncome: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Income")
        }
    }
}

struct ButtonExpense: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Expense")
        }
    }
}

struct BackgroundSurfaceMenuExpense: View {
    var body: some View {

        Rectangle()
            .fill(Color.customBackground)
            .aspectRatio(CGSize(width: 276, height: 567), contentMode: .fit)
            .background(Color.systemBackground)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)

    }
}

struct ButtonReturn: View {
    
    var body: some View {
        Button(action: {
            
            print("Home screen")
            
        }, label: {
            Image.returnButton
                .resizable()
        })
    }
}

#Preview {
    ExpenseMenu()
}
