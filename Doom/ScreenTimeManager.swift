import SwiftUI
import FamilyControls
import DeviceActivity

@MainActor
class ScreenTimeManager: ObservableObject {
    @Published var isAuthorized = false
    @Published var authorizationStatus: AuthorizationStatus = .notDetermined
    @Published var isLoading = false
    
    enum AuthorizationStatus {
        case notDetermined
        case denied
        case approved
    }
    
    func requestAuthorization() async {
        isLoading = true
        do {
            try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
            isAuthorized = true
            authorizationStatus = .approved
        } catch {
            print("Failed to authorize screen time: \(error)")
            isAuthorized = false
            authorizationStatus = .denied
        }
        isLoading = false
    }
    
    func checkAuthorizationStatus() {
        let status = AuthorizationCenter.shared.authorizationStatus
        switch status {
        case .notDetermined:
            authorizationStatus = .notDetermined
            isAuthorized = false
        case .denied:
            authorizationStatus = .denied
            isAuthorized = false
        case .approved:
            authorizationStatus = .approved
            isAuthorized = true
        @unknown default:
            authorizationStatus = .notDetermined
            isAuthorized = false
        }
    }
} 
