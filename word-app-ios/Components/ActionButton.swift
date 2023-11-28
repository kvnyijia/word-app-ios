import Foundation
import SwiftUI

struct ActionButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18, weight: .bold, design: .default))
            .padding(5)
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(30)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
