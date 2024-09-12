import SwiftUI

struct SettingsScreen: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Settings")
                        .font(.title2)
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                
                HStack(spacing: 0) {
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Mode")
                    }
                    .padding(20)
                }
                .padding()
                .background(Color.systemBackground)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
            }
            .navigationViewStyle(.stack) // iOS new version
            .accentColor(.primary)
        }
    }
}

#Preview {
    SettingsScreen()
}
