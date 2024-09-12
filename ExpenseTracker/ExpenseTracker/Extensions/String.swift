import Foundation


extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date()}
        
        return parsedDate
    }
}

extension Date {
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}
