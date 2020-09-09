import SwiftUI

struct ProgressColorKey: EnvironmentKey {
    static let defaultValue: Color = .red
}

extension EnvironmentValues {
    var progressColor: Color {
        get {
            return self[ProgressColorKey.self]
        }
        set {
            self[ProgressColorKey.self] = newValue
        }
    }
}

extension View {
    func progressColor(_ color: Color) -> some View {
        self.environment(\.progressColor, color)
    }
}
