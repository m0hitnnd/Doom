import SwiftUI
import FamilyControls
import DeviceActivity

struct DashboardView: View {
    @StateObject private var viewModel: DashboardViewModel
    
    init(screenTimeManager: ScreenTimeManager) {
        _viewModel = StateObject(wrappedValue: DashboardViewModel(screenTimeManager: screenTimeManager))
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                case .unauthorized:
                    ScreenTimeAuthView()
                case .authorized:
                    VStack(spacing: 16) {
                        ScreenTimeReportView(selectedApps: [], selectedCategories: [], selectedWebDomains: [])
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Colors.background)
                            .shadow(radius: 5)
                    )
                }
            }
            .padding()
            .navigationTitle("Dashboard")
        }
        .task {
            await viewModel.initialize()
        }
    }
}

#Preview {
    DashboardView(screenTimeManager: ScreenTimeManager())
} 
