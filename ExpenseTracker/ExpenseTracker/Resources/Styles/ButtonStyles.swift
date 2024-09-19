
import SwiftUI




struct WhiteButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 40, height: 40)
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.customIcon,.primary)
            .foregroundStyle(Color.white)
    }
    
}


struct EpenseButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 100, height: 40)
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.customIcon,.secondary)
            .foregroundStyle(Color.white)
    }
}
