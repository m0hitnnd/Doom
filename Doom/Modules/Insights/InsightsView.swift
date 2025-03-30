import SwiftUI

struct InsightsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Insights")
                    .font(.title)
                    .foregroundColor(Colors.text)
            }
            .navigationTitle("Insights")
        }
    }
}

#Preview {
    InsightsView()
} 