import SwiftUI
import FamilyControls
import DeviceActivity

struct ScreenTimeAuthView: View {
    @EnvironmentObject private var screenTimeManager: ScreenTimeManager
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "clock.badge.exclamationmark")
                .font(.system(size: 60))
                .foregroundColor(Colors.primary)
            
            Text("Screen Time Access Required")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Colors.text)
            
            Text("To help you minimize doom scrolling, we need access to your screen time data.")
                .multilineTextAlignment(.center)
                .foregroundColor(Colors.textSecondary)
                .padding(.horizontal)
            
            Button(action: {
                Task {
                    await screenTimeManager.requestAuthorization()
                }
            }) {
                Text("Grant Access")
            }
            .primaryStyle()
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    ScreenTimeAuthView()
        .environmentObject(ScreenTimeManager())
} 
