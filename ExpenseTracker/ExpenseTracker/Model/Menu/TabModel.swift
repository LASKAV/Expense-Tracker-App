import SwiftUI

enum TabModel: String, CaseIterable {
    case home = "house"
    case scheme = "scheme tracker"
    case settings = "settings"
    
    var title: String {
        switch self {
            case .home: "Home"
            case .scheme: "Scheme"
            case .settings: "Settings"
        }
    }
}
