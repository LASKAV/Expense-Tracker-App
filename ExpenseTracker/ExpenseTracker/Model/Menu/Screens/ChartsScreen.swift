import SwiftUI
import Charts

struct ChartsScreen: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // MARK: Title
                    Text("Charts")
                        .font(.title2)
                        .bold()
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                

            }
            .background(Color.customBackground)
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    ChartsScreen()
}
