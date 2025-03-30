import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Settings")
                    .font(.title)
                    .foregroundColor(Colors.text)
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
} 