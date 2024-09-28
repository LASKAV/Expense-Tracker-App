import SwiftUI

struct ExpenseMenu: View {
    let categories: [String] = [
            "Utilities",
            "Cellphone & Internet",
            "Mortgage",
            "Insurance",
            "Debt Repayment",
            "Taxes",
            "Gifts & Donations",
            "Entertainment",
            "Clothing & Accessories",
            "Memberships & Subscriptions",
            "Travel",
            "Business Investment",
            "Transportation",
            "Healthcare",
            "Housing / Rent" ]
    @State private var config: PickerConfig = .init(text: "Utilities")
    var body: some View {
        NavigationStack {
            List {
                Section("Expense") {
                    Button {
                        config.show.toggle()
                    } label: {
                        HStack {
                            Text("Type")
                                .foregroundStyle(.gray)
                            Spacer(minLength: 0)
                            SourcePickerView(config: $config)
                        }
                    }
                }
            }
            .navigationTitle("Expense")
        }
        .customPicker($config, items: categories)
    }
}

#Preview {
    ExpenseMenu()
}
