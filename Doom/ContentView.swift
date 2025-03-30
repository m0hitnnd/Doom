//
//  ContentView.swift
//  Doom
//
//  Created by Mohitnnd on 3/30/25.
//

import SwiftUI
import FamilyControls
import DeviceActivity

struct ContentView: View {
    @StateObject private var screenTimeManager = ScreenTimeManager()
    
    var body: some View {
        TabView {
            DashboardView(screenTimeManager: screenTimeManager)
                .environmentObject(screenTimeManager)
                .tabItem {
                    Label("Dashboard", systemImage: "chart.bar.fill")
                }
            
            InsightsView()
                .tabItem {
                    Label("Insights", systemImage: "brain.head.profile")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
