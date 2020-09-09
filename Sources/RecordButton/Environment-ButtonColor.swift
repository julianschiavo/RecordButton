import SwiftUI

struct ButtonColorKey: EnvironmentKey {
    static let defaultValue: Color = .pink
}

extension EnvironmentValues {
    var buttonColor: Color {
        get {
            return self[ButtonColorKey.self]
        }
        set {
            self[ButtonColorKey.self] = newValue
        }
    }
}

extension View {
    func buttonColor(_ color: Color) -> some View {
        self.environment(\.buttonColor, color)
    }
}

extension RecordButton {
    func buttonColor(_ color: Color) -> some View {
        self.environment(\.buttonColor, color)
    }
    
    func foregroundColor(_ color: Color) -> some View {
        self.environment(\.buttonColor, color)
    }
}

