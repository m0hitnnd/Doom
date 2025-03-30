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
                    Text("Dashboard")
                        .font(.title)
                        .foregroundColor(Colors.text)
                }
            }
            .navigationTitle("Dashboard")
        }
        .task {
            await viewModel.viewWillAppear()
        }
    }
}

#Preview {
    DashboardView(screenTimeManager: ScreenTimeManager())
} 
