
import Foundation

extension Double {
    func roundedToDigits() -> Double {
        return (self * 100).rounded() / 100
    }
}
