import SwiftUI
import FamilyControls
import DeviceActivity

enum DashboardState {
    case loading
    case unauthorized
    case authorized
}

@MainActor
class DashboardViewModel: ObservableObject {
    private let screenTimeManager: ScreenTimeManager
    
    @Published private(set) var state: DashboardState = .loading
    
    init(screenTimeManager: ScreenTimeManager) {
        self.screenTimeManager = screenTimeManager
    }
    
    func viewWillAppear() async {
        await screenTimeManager.requestAuthorization()
        updateState()
    }
    
    private func updateState() {
        if screenTimeManager.isLoading {
            state = .loading
        } else if !screenTimeManager.isAuthorized {
            state = .unauthorized
        } else {
            state = .authorized
        }
    }
}
