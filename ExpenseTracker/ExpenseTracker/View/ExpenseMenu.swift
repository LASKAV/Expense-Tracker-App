
import SwiftUI

struct ExpenseMenu: View {
    
    var body: some View {
            
            VStack(alignment: .center, spacing: 0) {
                BackgroundSurfaceMenuExpense()
                Text("asd")
        }
    }
}

struct BackgroundSurfaceMenuExpense: View {
    var body: some View {
        
        HStack() {
            
            ZStack() {
                
                BackgroundSurfaceMenuExpense()
                ButtonReturn(isChangeColor: false)
                
                Rectangle()
                    .fill(Color.customBackground)
                    .aspectRatio(CGSize(width: 276, height: 567), contentMode: .fit)
                    .background(Color.systemBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
                    .border(.black)
                
                
            }
        }
        .padding(40)
                
    }
}

struct ButtonReturn: View {
    
    let isChangeColor: Bool
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Image.plus
                .resizable()
                .frame(width: 40, height: 40)
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color.customIcon, .primary)
                .foregroundStyle(isChangeColor ? Color.black : Color.white)
            
        })
    }
}

#Preview {
    ExpenseMenu()
}
