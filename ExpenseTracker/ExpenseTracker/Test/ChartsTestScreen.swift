import Swift
import SwiftUI
import SwiftUICharts
import Charts


struct ChartsTestScreen: View {
    var body: some View {
        HStack {
//            ChartsEx3()
//            ChartEx4()
        }
    }
}


enum GradientColor {
    case orange
    case blue
    case green
    case blu
    case bluPurpl
    case purple
    case prplPink
    case prplNeon
    case orngPink
    
}



struct ChartsEx3: View {
    var body: some View {
        let data1 = mokData1()
        if !data1.isEmpty {
            VStack(alignment: .leading) {
                Chart(data1, id: \.0) { name, sales in
                    SectorMark(angle: .value("Value", sales))
                        .foregroundStyle(by: .value("Product category", name))
                }
            }
            
        }
    }
}

struct ChartEx4: View {
    var body: some View {
        let data2 = mokData2()
        if !data2.isEmpty {
            VStack(alignment: .leading) {
                Chart(data2, id: \.0) { name, sales in
                    SectorMark(
                        angle: .value("Value", sales),
                        innerRadius: .ratio(0.618),
                        outerRadius: .inset(10),
                        angularInset: 1
                    )
                    .cornerRadius(4)
                    .foregroundStyle(by: .value("Product category", sales))
                }
            }
        }
    }
}

struct ChartsEx1: View {
    var body: some View {
        let data2 = mokData2()
        if !data2.isEmpty {
            CardView {
                VStack(alignment: .leading) {
                    Chart(data2,id: \.0) { item in
                        BarMark(
                            x: .value("Month", item.0),
                            y: .value("value", item.1)
                        )
                    }
                }
            }
            .frame(width: 150, height: 150)
        }
    }
}

struct ChartsEx2: View {
    
    var body: some View {
        let data1 = mokData1()
        if !data1.isEmpty {
            
            VStack(alignment: .leading) {
                Chart(data1,id: \.0) { name, sales in
                    SectorMark(angle: .value("Value", sales))
                        .foregroundStyle(by: .value("Product category", sales))
                }
            }
        }
    }
}

func mokData1 () -> [(String, Int)] {
    let data = [
        ("liam_johnson", 50),
        ("olivia_williams", 130),
        ("noah_miller", 70),
        ("ava_davis", 40),
        ("elijah_garcia", 180),
        ("mia_martinez", 260)
    ]
    
    return data
}

func mokData2 () -> [(String, Int)] {
    let data = [
        ("alex_smith", 35),
        ("maria_jones", 80),
        ("john_doe", 150),
        ("sophia_wilson", 25),
        ("daniel_brown", 95),
        ("emma_clark", 220)
    ]
    
    return data
}


#Preview {
    ChartsTestScreen()
}
