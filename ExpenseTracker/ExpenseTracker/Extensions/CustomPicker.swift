import SwiftUI


// Custom View Modifier Extension
extension View {
    @ViewBuilder
    func customPicker(_ config: Binding<PickerConfig>, items: [String]) -> some View {
        self
            .overlay {
                if config.wrappedValue.show {
                    CustomPickerView(texts: items, config: config)
                        .transition(.identity)
                }
            }
    }
}

/// Source View
struct SourcePickerView: View {
    @Binding var config: PickerConfig
    var body: some View {
        Text(config.text)
            .foregroundStyle(.blue)
            .frame(height: 20)
            .opacity(config.show ? 0 : 1)
            .onGeometryChange(for: CGRect.self) { proxy in
                proxy.frame(in: .global)
            } action: { newValue in
                config.sourceFrame = newValue
            }
    }
}


// Picker Config
struct PickerConfig {
    var text: String
    init(text: String) {
        self.text = text
    }
    var show: Bool = false
    /// used for Custom Matched Geometry Effect
    var sourceFrame: CGRect = .zero
}


fileprivate struct CustomPickerView: View {
    var texts: [String]
    @Binding var config: PickerConfig
    /// View Private Properties
    @State private var activeText: String?
    @State private var showContents: Bool = false
    @State private var showScrollView: Bool = false
    @State private var expandItems: Bool = false
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            Rectangle()
                .fill(.ultraThinMaterial)
                .opacity(showContents ? 1 : 0)
                .ignoresSafeArea()
            
         
                ScrollView(.vertical) {
                    VStack(spacing: 0) {
                        ForEach(texts, id: \.self) { text in
                            CardView(text, size: size)
                        }
                    }
                    .scrollTargetLayout()
                }
                /// Making it to start and stop at the center
                .safeAreaPadding(.top, (size.height * 0.5) - 20)
                .safeAreaPadding(.bottom, (size.height * 0.5))
                .scrollPosition(id: $activeText, anchor: .center)
                .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                .scrollIndicators(.hidden)
                .opacity(showScrollView ? 1 : 0)
                .allowsHitTesting(expandItems && showScrollView)
            
            let offset: CGSize = .init(
                width: showContents ? size.width * -0.3 : config.sourceFrame.minX,
                height: showContents ? -10 : config.sourceFrame.minY)
            
            Text(config.text)
                .fontWeight(showContents ? .semibold : .regular)
                .foregroundStyle(.blue)
                .frame(height: 20)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: showContents ? .trailing : .topLeading)
                .offset(offset)
                .opacity(showScrollView ? 0 : 1)
                .ignoresSafeArea(.all, edges: showContents ? [] : .all)
            
            CloseButton()
            
        }
        .task {
            /// Doing actions only for the frst time
            guard activeText == nil else { return }
            activeText = config.text
            withAnimation(.easeInOut(duration: 0.3)) {
                showContents = true
            }
            try? await Task.sleep(for: .seconds(0.3))
            showScrollView = true
            
            withAnimation(.snappy(duration: 0.3, extraBounce: 0)) {
                
            }
        }
        .onChange(of: activeText) { oldValue, newValue in
            if let newValue {
                config.text = newValue
            }
        }
    }
    
    /// Close Button
    @ViewBuilder
    func CloseButton() -> some View {
        Button {
            Task {
                /// Order
                /// 1. Minimistig all the elements
                withAnimation(.easeInOut(duration: 0.2)) {
                    expandItems = false
                }
                
                try? await Task.sleep(for: .seconds(0.2))
                /// 2. Hiding ScrollView and Placing the Active item back
                /// to it's source position
                showScrollView = false
                withAnimation(.easeInOut(duration: 0.2)) {
                    showContents = false
                }
                
                try? await Task.sleep(for: .seconds(0.2))
                
                /// 3. Finally Closing the Overlay View
                config.show = false
            }
            
        } label: {
            Image(systemName: "xmark")
                .font(.title2)
                .foregroundStyle(Color.primary)
                .frame(width: 45, height: 45)
                .contentShape(.rect)
        }
        /// Making it right next to the active picker element
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        .offset(x: expandItems ? -50 : 50, y: -10)

    }
    

    /// Card View
    @ViewBuilder
    private func CardView(_ text: String, size: CGSize) -> some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            
            Text(text)
                .fontWeight(.semibold)
                .foregroundStyle(config.text == text ? .blue : .gray)
                .offset(y: offset(proxy))
                .opacity(expandItems ? 1 : config.text == text ? 1 : 0)
                .clipped()
                .offset(x: -width * 0.3)
                .rotationEffect(.init(degrees: expandItems ? -rortation(proxy, size) : .zero), anchor: .topTrailing)
                .opacity(opacity(proxy, size))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        }
        .frame(height: 20)
        .lineLimit(1)
    }
    /// View Transition Helpers
    private func offset(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        return expandItems ? 0 : -minY
    }
    
    private func rortation(_ proxy: GeometryProxy, _ size: CGSize) -> CGFloat {
            
        let height = size.height * 0.5
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        
        /// You can use your own custom value here
        let maxRotation: CGFloat = 220
        let progress = minY / height
        
        return progress * maxRotation
    }
    /// Opacity items
    private func opacity(_ proxy: GeometryProxy, _ size: CGSize) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).midY
        let height = size.height * 0.5
        let progress = (minY / height) * 2.5
        
        /// Eliminatig Negative Opacity
        let opacity = progress < 0 ? 1 + progress : 1 - progress
        
        return opacity
    }
}

struct CustomPicker: View {
    var body: some View {
        Text("Hello")
    }
}

#Preview {
    @Previewable
    @State var config = PickerConfig(text: "Utilities")
    let categories = [
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
            "Food & Drinks",
            "Groceries",
            "Repairs",
            "Personal Care",
            "Healthcare",
            "Housing / Rent" ]
    
    CustomPickerView(texts: categories, config: $config)
}
