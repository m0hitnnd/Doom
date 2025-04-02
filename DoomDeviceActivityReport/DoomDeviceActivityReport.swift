//
//  DoomDeviceActivityReport.swift
//  DoomDeviceActivityReport
//
//  Created by Mohitnnd on 4/2/25.
//

import DeviceActivity
import SwiftUI

@main
struct DoomDeviceActivityReport: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        // Create a report for each DeviceActivityReport.Context that your app supports.
        TotalActivityReport { totalActivity in
            TotalActivityView(totalActivity: totalActivity)
        }
        // Add more reports here...
    }
}
