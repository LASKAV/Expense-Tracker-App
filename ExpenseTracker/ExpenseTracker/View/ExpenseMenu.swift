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
            ScrollView {
                
                Spending()
                
                NavigationStack {
                    
                    
                    VStack(alignment: .center, spacing: 30) {
                        
                        // MARK: Calendar
                        Button {
                            config.show.toggle()
                        } label: {
                            HStack {
                                
                                Image(systemName: "calendar.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Text("Date")
                                    .foregroundStyle(.gray)
                                Spacer(minLength: 0)
                                SourcePickerView(config: $config)
                            }
                        }
                        
                        Divider()
                        
                        // MARK: Category
                        Button {
                            config.show.toggle()
                        } label: {
                            HStack {
                                
                                Image(systemName: "magnifyingglass.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("Category")
                                    .foregroundStyle(.gray)
                                Spacer(minLength: 0)
                                SourcePickerView(config: $config)
                            }
                        }
            
                        Divider()
                        // MARK: Title
                        Button {
                            config.show.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "character.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("Title")
                                    .foregroundStyle(.gray)
                                Spacer(minLength: 0)
                                SourcePickerView(config: $config)
                            }
                        }
                        
                        Divider()

                        // MARK: Spent
                        
                        Button {
                            config.show.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "creditcard.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("Spent")
                                    .foregroundStyle(.gray)
                                Spacer(minLength: 0)
                                SourcePickerView(config: $config)
                            }
                        }
                    }
                    .padding(20)
                    .background(Color.systemBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
                    .padding(10)
                    
                    
                }
                .customPicker($config, items: categories)
            }
            
            .background(Color.customBackground)
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct someView: View {
    var body: some View {
        Rectangle()
            .frame(width: 400,height: 500)
            .cornerRadius(30)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct Spending: View {
    @State var titleSpending: String = "100.00"
    
    var body: some View {
        HStack {
            Text("\(titleSpending) " + "$")
                .foregroundStyle(Color.customIcon)
                .font(.system(size: 35))
                .bold()
                
        }
        .padding([.bottom, .top], 50)
        .padding([.leading, .trailing], 100)
//        .border(.blue)
    }
}



#Preview {
    ExpenseMenu()
}
